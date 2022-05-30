package com.example.device_info

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.app.ActivityManager
import android.app.ActivityManager.MemoryInfo
import android.content.Context
import android.content.Context.BATTERY_SERVICE
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.content.res.Configuration
import android.graphics.ImageFormat
import android.hardware.Camera
import android.hardware.Camera.CameraInfo
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager
import android.hardware.camera2.CaptureRequest
import android.media.MediaDrm
import android.net.DhcpInfo
import android.net.Uri
import android.net.wifi.WifiManager
import android.os.BatteryManager
import android.os.Build
import android.os.Environment
import android.os.StatFs
import android.provider.Settings
import android.provider.Settings.Secure
import android.util.DisplayMetrics
import android.util.Log
import android.util.Size
import android.view.WindowManager
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.example.device_info.Root.RootUtil
import com.example.device_info.model.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.util.ViewUtils.getActivity
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.*
import java.net.Inet4Address
import java.net.Inet6Address
import java.net.InetAddress
import java.net.NetworkInterface
import java.security.MessageDigest
import java.util.*
import java.util.regex.Pattern
import kotlin.math.pow
import kotlin.math.roundToInt
import kotlin.math.sqrt


/** DeviceInfoPlugin */
class DeviceInfoPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private  var context: Context? = null
    private var baseContext: Context? = null
    private var appContext: Context? = null
    private lateinit var mactivity: Activity


    private val wuuid = UUID(-0x121074568629b532L, -0x5c37d8232ae2de13L)

    private val CPU_INFO_DIR = "/sys/devices/system/cpu/"
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        mactivity = binding.activity
        baseContext = mactivity.baseContext
        appContext = mactivity.applicationContext
        checkAndRequestPermissions();
        checkSystemWritePermission();

    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        mactivity = binding.activity
        baseContext = mactivity.baseContext
        appContext = mactivity.applicationContext
    }

    override fun onDetachedFromActivity() {

    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "device_info")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        val cameraManager =
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                getActivity(appContext)?.getSystemService(Context.CAMERA_SERVICE) as CameraManager?
            } else {
                null
            }
    }


    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "androidDeviceInfo" -> result.success(Json.encodeToString(getAndroidInfo()))
            "androidInfo" -> result.success(Json.encodeToString(getAndroid()))
            "batteryInfo" -> result.success(Json.encodeToString(getBatteryInfo()))
            "cameraInfo" -> result.success(Json.encodeToString(getCameraInfo()))
            "cpuInfo" -> result.success(Json.encodeToString(getCPU()))
            "displayInfo" -> result.success(Json.encodeToString(getDisplayInfo()))
            "drmInfo" -> result.success(Json.encodeToString(getDrmInfo()))
            "memoryInfo" -> result.success(Json.encodeToString(getMemoryInfo()))
            "networkInfo" -> result.success(Json.encodeToString(getNetworkInfo()))
            "simInfo" -> result.notImplemented()
            "systemFiles" -> result.notImplemented()
            "systemInfo" -> result.success(Json.encodeToString(getSystem()))
            "thermal" -> result.notImplemented()
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        context=null
        baseContext = null
        appContext = null
    }

    private fun getAndroidInfo(): AndroidDeviceInfo {
        //  baseContext?.let { println("basecontext is not null") }
        // appContext?.let { println("application context is not null") }
        return AndroidDeviceInfo(
            android = getAndroid(),
            battery = getBatteryInfo(),
            camera = getCameraInfo(),
            cpu = getCPU(),
            drmInfo = getDrmInfo(),
            display = getDisplayInfo(),
            memory = getMemoryInfo(),
            simInfo = null,
            network = getNetworkInfo(),
            system = getSystem(),
            systemFile = null,
            thermal = null,
        )
    }

    private fun getSystem(): SystemInfo {
        return SystemInfo(
            manufacture = Build.MANUFACTURER ,
            model = Build.MODEL,
            brand = Build.BRAND,
            android = Build.VERSION.RELEASE,
            apiLevel = Build.VERSION.SDK_INT.toString(),
            codeName =getCodeName(),
            density = getDisplayDensity(),
            refreshRate = getScreenRefreshRate(),
            product = Build.PRODUCT,
            board = Build.BOARD,
            build = Build.ID,
            javaVmVersion = System.getProperty("java.vm.version") ?: "",
            security = getSecurityPatch(),
            baseband = Build.getRadioVersion(),
            serial = getSerial(),
            buildType = Build.TYPE,
            tags = Build.TAGS,
            incremental = Build.VERSION.INCREMENTAL,
            fingerprint = Build.FINGERPRINT,
            fingerprintManufacture = "",
            fingerprintModel = "",
            defaultOrientation = getDeviceOrientation(),
            bootloader = Build.BOOTLOADER,
            selinux = System.getProperty("ro.build.selinux") ?: "UNKNOWN"


        );
    }

    private  fun  getCodeName():String{
        val fields = Build.VERSION_CODES::class.java.fields
        var codeName = "UNKNOWN"
        fields.filter { it.getInt(Build.VERSION_CODES::class) == Build.VERSION.SDK_INT }
            .forEach { codeName = it.name }
        return codeName
    }

    @SuppressLint("HardwareIds")
    private fun getSerial(): String {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
          return  try {
                Build.getSerial()
            }catch (e:Exception){
                "$e"
            }
        } else {
            Build.SERIAL
        }
    }

    private fun checkAndRequestPermissions(): Boolean {
        return when {
            checkPermission() -> {
                true
            }
            else -> {
                ActivityCompat.requestPermissions(mactivity,
                    listOf(Manifest.permission.CAMERA).toTypedArray(),
                    50);
                checkPermission()
            }
        }
    }

    private fun checkPermission(): Boolean {
        return when {
            baseContext?.let { ContextCompat.checkSelfPermission(it, Manifest.permission.CAMERA) }
                    != PackageManager.PERMISSION_GRANTED -> false
            else -> (baseContext?.let {
                ContextCompat.checkSelfPermission(it,
                    Manifest.permission.CAMERA)
            }
                    == PackageManager.PERMISSION_GRANTED)
        }
    }

    private fun getCameraInfo(): CameraInfos? {
        val cameras = mutableListOf<Cameras>()
        val camerasize = getNoOfCameras()
        if (checkAndRequestPermissions()) {
            //    println(baseContext?.let { checkCameraHardware(it) })
            when {
                baseContext?.let { checkCameraHardware(it) } == true -> {
                    (0 until camerasize).forEach { i ->
                        getCameraInfoByID(id = i)?.let {
                            //  println(it)
                            cameras.add(it)
                        }
                    }
                }
                else -> {
                    return null
                }
            }
        }

        return CameraInfos(cameras)
    }

    private fun getCameraInfoByID(id: Int): Cameras? {
        //  println("id $id")
        when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP -> {
                val cameraManager =
                    mactivity.getSystemService(Context.CAMERA_SERVICE) as CameraManager?
                ///  cameraManager?.let { println("camera manager is not null") }

                when {
                    cameraManager != null -> {
                        return Cameras(
                            name = id.toString(),
                            resolution = getResolutionMPByCameraID(cameraManager, id),
                            videoResolution = getVideoResolutionByCameraID(cameraManager, id),
                            orientation = getOrientation(cameraManager, id),
                            focalLength = getFocalLength(cameraManager, id),
                            focusModes = getFocusModes(cameraManager, id),
                            videoSnapshotSupported = isVideoSnapshotSupported(cameraManager, id),
                            videoStabilizationSupported = isVideoStabilizationSupported(
                                cameraManager,
                                id),
                            zoomSupported = isZoomSupported(cameraManager, id),
                            smoothZoomSupported = isSmoothZoomSupported(),
                            autoExposureLockingSupported = isAELockingSupported(cameraManager,
                                id),
                            autoWhiteBalanceLockingSupported = isAWBSupported(cameraManager,
                                id),
                            flashSupported = isFlashSupported(cameraManager, id)
                        );
                    }
                    else -> {
                        return null;
                    }
                }
            }
            Build.VERSION.SDK_INT > Build.VERSION_CODES.JELLY_BEAN_MR2 -> {
                //    println("less than lolipop info")
                return Cameras(
                    name = id.toString(),
                    resolution = getCameraResolutionInMp(id),
                    videoResolution = getVideoResolutionINMP(id),
                    orientation = getOrientation(id),
                    focalLength = getFocalLength(id),
                    focusModes = getFocusModes(id),
                    videoSnapshotSupported = isVideoSnapshotSupported(id),
                    videoStabilizationSupported = isVideoStabilizationSupported(id),
                    zoomSupported = isZoomSupported(id),
                    smoothZoomSupported = isSmoothZoomSupported(id),
                    autoExposureLockingSupported = isAELockingSupported(id),
                    autoWhiteBalanceLockingSupported = isAWBLockingSupported(id),
                    flashSupported = isFlashSupported(id)
                );
            }
            else -> return null
        }
    }

    private fun isFlashSupported(id: Int): Boolean {
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id) ?: return false
        val parameters: Camera.Parameters = camera.getParameters()
        if (parameters.flashMode == null) {
            return false
        }
        val supportedFlashModes = parameters.supportedFlashModes
        return !(supportedFlashModes == null || supportedFlashModes.isEmpty() || supportedFlashModes.size == 1 && supportedFlashModes[0] == Camera.Parameters.FLASH_MODE_OFF)
    }

    private fun isAWBLockingSupported(id: Int): Boolean {
        val noOfCameras = Camera.getNumberOfCameras()
        var issupported = false
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        issupported = cameraParams.isAutoWhiteBalanceLockSupported
        camera.release()
        return issupported
    }

    private fun isAELockingSupported(id: Int): Boolean {
        val noOfCameras = Camera.getNumberOfCameras()
        var issupported = false
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        issupported = cameraParams.isAutoExposureLockSupported
        camera.release()
        return issupported
    }

    private fun isSmoothZoomSupported(id: Int): Boolean {
        val noOfCameras = Camera.getNumberOfCameras()
        var issupported = false
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        issupported = cameraParams.isSmoothZoomSupported
        camera.release()
        return issupported
    }

    private fun isZoomSupported(id: Int): Boolean {
        val noOfCameras = Camera.getNumberOfCameras()
        var issupported = false
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        issupported = cameraParams.isZoomSupported
        camera.release()
        return issupported
    }

    private fun isVideoStabilizationSupported(id: Int): Boolean {
        val noOfCameras = Camera.getNumberOfCameras()
        var issupported = false
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        issupported = cameraParams.isVideoStabilizationSupported
        camera.release()
        return issupported
    }

    private fun isVideoSnapshotSupported(id: Int): Boolean {
        val noOfCameras = Camera.getNumberOfCameras()
        var issupported = false
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        issupported = cameraParams.isVideoSnapshotSupported
        camera.release()
        return issupported
    }

    private fun getFocusModes(id: Int): List<String> {
        val noOfCameras = Camera.getNumberOfCameras()
        var focusmodes = mutableListOf<String>()
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        focusmodes = cameraParams.supportedFocusModes
        camera.release()
        return focusmodes
    }

    private fun getFocalLength(id: Int): String {
        val noOfCameras = Camera.getNumberOfCameras()
        var focallength = -1f
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        focallength = cameraParams.focalLength
        camera.release()
        return focallength.toString()
    }

    private fun getOrientation(id: Int): String {
        val noOfCameras = Camera.getNumberOfCameras()
        var angle = -1f
        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)
        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        angle = cameraParams.horizontalViewAngle
        camera.release()
        return angle.toString()
    }

    private fun getVideoResolutionINMP(id: Int): String {
        val noOfCameras = Camera.getNumberOfCameras()
        var maxResolution = -1f
        var pixelCount: Long = -1

        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)

        val camera = Camera.open(id)
        val cameraParams = camera.parameters
        for (j in cameraParams.supportedVideoSizes.indices) {
            val pixelCountTemp =
                (cameraParams.supportedVideoSizes[j].width * cameraParams.supportedVideoSizes[j].height).toLong() // Just changed i to j in this loop
            if (pixelCountTemp > pixelCount) {
                pixelCount = pixelCountTemp
                maxResolution = pixelCountTemp.toFloat() / 1024000.0f
            }
        }
        camera.release()
        return maxResolution.toString() + "MP"
    }

    private fun getCameraResolutionInMp(id: Int): String {
        val noOfCameras = Camera.getNumberOfCameras()
        var maxResolution = -1f
        var pixelCount: Long = -1

        val cameraInfo = CameraInfo()
        Camera.getCameraInfo(id, cameraInfo)

        val camera = Camera.open(id)
        val cameraParams = camera.parameters

        for (j in cameraParams.supportedPictureSizes.indices) {
            val pixelCountTemp =
                (cameraParams.supportedPictureSizes[j].width * cameraParams.supportedPictureSizes[j].height).toLong() // Just changed i to j in this loop
            if (pixelCountTemp > pixelCount) {
                pixelCount = pixelCountTemp
                maxResolution = pixelCountTemp.toFloat() / 1024000.0f
            }
        }
        camera.release()
        return maxResolution.toString() + "MP"
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun isFlashSupported(cameraManager: CameraManager, id: Int): Boolean {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        val isSupported = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            characteristics.get(CameraCharacteristics.FLASH_INFO_AVAILABLE) ?: false
        } else {
            false
        }
        return isSupported
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun isAWBSupported(cameraManager: CameraManager, id: Int): Boolean {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        val isSupported = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            characteristics.get(CameraCharacteristics.CONTROL_AWB_LOCK_AVAILABLE) ?: false
        } else {
            false
        }
        return isSupported
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun isAELockingSupported(cameraManager: CameraManager, id: Int): Boolean {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        val isSupported = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            characteristics.get(CameraCharacteristics.CONTROL_AE_LOCK_AVAILABLE) ?: false
        } else {
            false
        }
        return isSupported
    }

    private fun isSmoothZoomSupported(): Boolean {
        return Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP;
    }


    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun isZoomSupported(cameraManager: CameraManager, id: Int): Boolean {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        val focallengths =
            characteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS)
        return if (focallengths != null) focallengths.size > 1 else false
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun isVideoStabilizationSupported(cameraManager: CameraManager, id: Int): Boolean {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        val modes =
            characteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES)
        return modes?.contains(CameraCharacteristics.CONTROL_VIDEO_STABILIZATION_MODE_ON) ?: false
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun isVideoSnapshotSupported(cameraManager: CameraManager, id: Int): Boolean {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        val modes = characteristics.keys

        for (mode in modes) {
            //   println(mode)
            if (mode == CaptureRequest.CONTROL_CAPTURE_INTENT) {
                return true
            }
        }
        return false
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun getFocusModes(cameraManager: CameraManager, id: Int): List<String> {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        val modes = characteristics.get(CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES);
        val stringmodes = mutableListOf<String>()
        modes?.forEach {
            when (it) {
                CaptureRequest.CONTROL_AF_MODE_AUTO -> stringmodes.add("auto")
                CaptureRequest.CONTROL_AF_MODE_CONTINUOUS_PICTURE -> stringmodes.add("continuous-picture")
                CaptureRequest.CONTROL_AF_MODE_CONTINUOUS_VIDEO -> stringmodes.add("continuous-video")
                CaptureRequest.CONTROL_AF_MODE_EDOF -> stringmodes.add("extended depth of field")
                CaptureRequest.CONTROL_AF_MODE_MACRO -> stringmodes.add("macro")
                CaptureRequest.CONTROL_AF_MODE_OFF -> stringmodes.add("off")
            }
        }

        return stringmodes

    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun getFocalLength(cameraManager: CameraManager, id: Int): String {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        return characteristics.get(CameraCharacteristics.LENS_INFO_HYPERFOCAL_DISTANCE).toString()
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun getOrientation(cameraManager: CameraManager, id: Int): String {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        return characteristics.get(CameraCharacteristics.SENSOR_ORIENTATION).toString()
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun getVideoResolutionByCameraID(cameraManager: CameraManager, id: Int): String {
        val cameraId = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(cameraId)
        val map = characteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)
        val sizes = map?.getOutputSizes(ImageFormat.RAW_SENSOR)
        return sizes?.let { getCameraMP(size = it) } ?: ""


    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun getCameraMP(size: Array<Size>): String {
        var finalCameraRes = getMP(size[0], 1)
        var maxSize: Int = size[0].height * size[0].width
        for (camSize in size) {
            val tempMax: Int = camSize.height * camSize.width
            if (tempMax > maxSize) {
                maxSize = tempMax
                finalCameraRes = getMP(camSize, 1)
            }
        }
        return finalCameraRes
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun getMP(size: Size, decimalPlaces: Int): String {
        val mp: Float = size.width * size.height / 1000000f
        return when (decimalPlaces) {
            1 -> {
                java.lang.String.format(Locale.US, "%.1f", mp).toString() + " MP"
            }
            2 -> {
                java.lang.String.format(Locale.US, "%.2f", mp).toString() + " MP"
            }
            else -> {
                java.lang.String.format(Locale.US, "%.2f", mp).toString() + " MP"
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun getResolutionMPByCameraID(cameraManager: CameraManager, id: Int): String {
        val currentcamera = cameraManager.cameraIdList[id]
        val characteristics: CameraCharacteristics =
            cameraManager.getCameraCharacteristics(currentcamera)
        val mp =
            calculateMegaPixel(characteristics.get(CameraCharacteristics.SENSOR_INFO_PIXEL_ARRAY_SIZE)?.width
                ?: 0,
                characteristics.get(CameraCharacteristics.SENSOR_INFO_PIXEL_ARRAY_SIZE)?.height
                    ?: 0)
        //  println("$mp MP")
        return "$mp MP"

    }

    private fun calculateMegaPixel(width: Int, height: Int): Int {
        return (width * height / 1024000).toDouble().roundToInt()
    }

    private fun getNoOfCameras(): Int {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            // println("greater than lolipop")
            val cameraManager =
                mactivity.getSystemService(Context.CAMERA_SERVICE) as CameraManager?
            //   println(cameraManager?.cameraIdList?.size)
            return cameraManager?.cameraIdList?.size ?: 0
        } else if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
            // println("Less than lolipop")
            return Camera.getNumberOfCameras()
        }
        return 0
    }

    /** Check if this device has a camera */
    private fun checkCameraHardware(context: Context): Boolean {
        return context.packageManager.hasSystemFeature(PackageManager.FEATURE_CAMERA_ANY)
    }

    private fun getNetworkInfo(): Network {
        return Network(Telephony(), wifi = getWIFI())
    }

    private fun getWIFI(): WIFI {
        val wifiManager =
            context?.applicationContext?.getSystemService(Context.WIFI_SERVICE) as WifiManager
        val wifiInfo = wifiManager.connectionInfo
        return WIFI(
            state = getWifiState(wifiManager.wifiState),
            ssid = wifiInfo.ssid,
            bssid = wifiInfo.bssid,
            hiddenSsid = wifiInfo.hiddenSSID,
            ipv4Address = null,
            ipv6Address = null,
            signalStrength = getSignalStrength(wifiManager),
            linkSpeed = """${wifiInfo.linkSpeed}Mbps""",
            frequency = getFrequency(wifiManager),
            networkId = wifiInfo.networkId.toString(),
            gateway = getGatewayIpAdress(wifiManager),
            netmask = wifiManager.dhcpInfo.netmask.toString(),
            dns1 = wifiManager.dhcpInfo.dns1.toString(),
            dhcpLeaseDuration = wifiManager.dhcpInfo.leaseDuration.toString(),
            w5ghzBand = get5GHZSupported(wifiManager),
            isWifiAware = isWifiAware(),
            isWifiDirectAvailable = isWifiDirectAvailable(wifiManager)
        )
    }

    private fun isWifiDirectAvailable(wifiManager: WifiManager): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            wifiManager.isP2pSupported
        } else {
            context?.packageManager?.hasSystemFeature("android.hardware.wifi.direct")?:false
        }
    }

    private fun isWifiAware(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            context?.packageManager?.hasSystemFeature(PackageManager.FEATURE_WIFI_AWARE)?:false
        } else {
            false
        }
    }

    private fun get5GHZSupported(wifiManager: WifiManager): String {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            if (wifiManager.is5GHzBandSupported) {
                "Supported"
            } else "Not Supported"
        } else {
            "UNKNOWN"
        }
    }

    private fun getGatewayIpAdress(wifiManager: WifiManager): String {
        val dhcpInfo: DhcpInfo = wifiManager.dhcpInfo
        val gatewayIPInt = dhcpInfo.gateway
        return String.format(
            "%d.%d.%d.%d",
            gatewayIPInt and 0xFF,
            gatewayIPInt shr 8 and 0xFF,
            gatewayIPInt shr 16 and 0xFF,
            gatewayIPInt shr 24 and 0xFF)
    }

    private fun getFrequency(wifiManager: WifiManager): String {
        val wifiInfo = wifiManager.connectionInfo
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            wifiInfo.frequency.toString() + " MHz"
        } else {
            return "UNKNOWN"
        }
    }

    private fun getSignalStrength(wifiManager: WifiManager): String {

        val numberOfLevels = 5
        val wifiInfo = wifiManager.connectionInfo
        val level = WifiManager.calculateSignalLevel(wifiInfo.rssi, numberOfLevels)

        return when {
            level >= -50 -> {
                "$level dBm (Best signal)"
            }
            level >= -70 -> {
                "$level dBm (Good signal)"
            }
            level >= -80 -> {
                "$level dBm (Low signal)"
            }
            level >= -100 -> {
                "$level dBm (Very weak signal)"
            }
            else -> {
                "$level dBm (Too low signal)"
            }
        }
    }

    private fun getIpv4(): String? {
        try {
            val en: Enumeration<NetworkInterface> = NetworkInterface
                .getNetworkInterfaces()
            while (en.hasMoreElements()) {
                val intf: NetworkInterface = en.nextElement()
                val enumIpAddr: Enumeration<InetAddress> = intf
                    .inetAddresses
                while (enumIpAddr.hasMoreElements()) {
                    val inetAddress: InetAddress = enumIpAddr.nextElement()
                    if (!inetAddress.isLoopbackAddress && inetAddress is Inet4Address) {
                        return inetAddress.getHostAddress()?.toString()
                    }
                }
            }
        } catch (ex: java.lang.Exception) {
            Log.e("IP Address", ex.toString())
        }
        return null
    }

    //ipv6
    private fun getLocalIpV6(): String? {
        try {
            val en: Enumeration<NetworkInterface> = NetworkInterface
                .getNetworkInterfaces()
            while (en.hasMoreElements()) {
                val intf: NetworkInterface = en.nextElement()
                val enumIpAddr: Enumeration<InetAddress> = intf
                    .inetAddresses
                while (enumIpAddr.hasMoreElements()) {
                    val inetAddress: InetAddress = enumIpAddr.nextElement()

                    if (!inetAddress.isLoopbackAddress && inetAddress is Inet6Address) {
                        return inetAddress.getHostAddress()?.toString()
                    }
                }
            }
        } catch (ex: java.lang.Exception) {
            Log.e("IP Address", ex.toString())
        }
        return null
    }

    private fun getWifiState(state: Int): String {
        return when (state) {
            WifiManager.WIFI_STATE_ENABLED -> "Enabled"
            WifiManager.WIFI_STATE_DISABLED -> "Disabled"
            WifiManager.WIFI_STATE_ENABLING -> "Enabling"
            WifiManager.WIFI_STATE_DISABLING -> "Disabling"
            WifiManager.WIFI_STATE_UNKNOWN -> "UNKNOWN STATE"
            else -> "Unknown"
        }
    }

    private fun getMemoryInfo(): Memory {
        return Memory(
            ram = getRamInfo(),
            internal = getInternalStrorageInfo(),
            external = getExternalStorageInfo(),
        )
    }

    private fun getExternalStorageInfo(): MemoryTypeInfo? {
        val isSDPresent = Environment.getExternalStorageState() == Environment.MEDIA_MOUNTED
        val isSDSupportedDevice = Environment.isExternalStorageRemovable()
        when {
            isSDSupportedDevice && isSDPresent -> {
                val statFs = StatFs(Environment.getRootDirectory().absolutePath)
                val externalTotal = (statFs.blockCount * statFs.blockSize) / 1048576.toLong()
                val externalFree = (statFs.availableBlocks * statFs.blockSize / 1048576).toLong()
                val used = externalTotal - externalFree
                return MemoryTypeInfo(
                    name = "External",
                    used = bytesToHuman(used),
                    free = bytesToHuman(externalFree),
                    total = bytesToHuman(externalTotal)
                )
            }
            else -> {
                return null
            }
        }

    }

    private fun getInternalStrorageInfo(): MemoryTypeInfo {
        val KILOBYTE = 1024
        val internalTotal: Long = File(context?.filesDir?.absoluteFile.toString()).totalSpace
        val internalFree: Long = File(context?.filesDir?.absoluteFile.toString()).freeSpace

        val used = internalTotal - internalFree
        return MemoryTypeInfo(
            name = "INTERNAL",
            used = bytesToHuman(used),
            free = bytesToHuman(internalFree),
            total = bytesToHuman(internalTotal)
        )
    }

    private fun getRamInfo(): MemoryTypeInfo {
        val actManager = context?.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val memInfo = MemoryInfo()
        actManager.getMemoryInfo(memInfo)
        val totalMemory = memInfo.totalMem
        val availMemory = memInfo.availMem
        val usedMemory = totalMemory - availMemory
        return MemoryTypeInfo(
            name = "RAM",
            used = bytesToHuman(usedMemory),
            free = bytesToHuman(availMemory),
            total = bytesToHuman(totalMemory),
        )
    }

    private fun floatForm(d: Double): String {
        return String.format(Locale.US, "%.2f", d)
    }

    private fun bytesToHuman(size: Long): String {
        val Kb: Long = 1024
        val Mb = Kb * 1024
        val Gb = Mb * 1024
        val Tb = Gb * 1024
        val Pb = Tb * 1024
        val Eb = Pb * 1024
        return when {
            size < Kb -> floatForm(size.toDouble()) + " byte"
            size in Kb until Mb -> floatForm(size.toDouble() / Kb) + " KB"
            size in Mb until Gb -> floatForm(size.toDouble() / Mb) + " MB"
            size in Gb until Tb -> floatForm(size.toDouble() / Gb) + " GB"
            size in Tb until Pb -> floatForm(size.toDouble() / Tb) + " TB"
            size in Pb until Eb -> floatForm(size.toDouble() / Pb) + " Pb"
            else -> if (size >= Eb) floatForm(size.toDouble() / Eb) + " Eb" else "0"
        }
    }


    private fun getCPU(): CPUInfo {

        return CPUInfo(
            soc = getCurrentCPUInfo(key1 = "model name", key2 = "Processor"),
            cpu = Build.BOARD,
            supportedAbis = getAbi(),
            supported32bitAbis = get32BitABIs(),
            supported64bitAbis = get64BitABIs(),
            cores = getNumberOfCores().toString(),
            machines = System.getProperty("os.arch") ?: "UNKNOWN",
            vendor = getCurrentCPUInfo(key1 = "vendor_id", key2 = "Hardware"),
            cpuClockRange = getCPUFreq(),
            revision = getCurrentCPUInfo(key1 = "revision", key2 = "CPU revision"),
            instructions = getCurrentCPUInfo(key1 = "flags", key2 = "Features").split(" ").toList(),
            governer = getCPUGovernor(0),
        )
    }

    private fun getCPUGovernor(core: Int): String {
        var governor = ""
        val file = "/sys/devices/system/cpu/cpu$core/cpufreq/scaling_governor"
        if (File(file).exists()) {
            try {
                val bufferedReader = BufferedReader(FileReader(File(file)))
                governor = bufferedReader.readLine()
                bufferedReader.close()
            } catch (e: FileNotFoundException) {
                governor = "Not Found"
            } catch (e: IOException) {
                e.printStackTrace()
            }
        }
        return governor
    }

    private fun getCPUFreq(): String {
        return getMinCPUFreq(0).toString() + " - " + getMaxCPUFreq(0) + " MHz"
    }

    private fun getMinCPUFreq(core: Int): Int {
        var minFreq = -1
        val filepath = "/sys/devices/system/cpu/cpu$core/cpufreq/cpuinfo_min_freq"
        if (File(filepath).exists()) {
            try {
                val randomAccessFile =
                    RandomAccessFile(filepath, "r")
                val done = false
                while (!done) {
                    val line = randomAccessFile.readLine() ?: break
                    val timeInState = line.toInt()
                    if (timeInState > 0) {
                        val freq = timeInState / 1000
                        if (freq > minFreq) {
                            minFreq = freq
                        }
                    }
                }
            } catch (e: IOException) {
                e.printStackTrace()
            }
        }

        return minFreq
    }

    private fun getMaxCPUFreq(core: Int): Int {
        var currentFReq = 0
        val filepath = "/sys/devices/system/cpu/cpu$core/cpufreq/cpuinfo_max_freq"
        if (File(filepath).exists()) {
            try {
                val currentFreq: Double
                val readerCurFreq =
                    RandomAccessFile(filepath, "r")
                val curfreg = readerCurFreq.readLine()
                currentFreq = curfreg.toDouble() / 1000
                readerCurFreq.close()
                currentFReq = currentFreq.toInt()
            } catch (ex: java.lang.Exception) {
                ex.printStackTrace()
            }
        }

        return currentFReq
    }

    private fun getCurrentCPUInfo(key1: String, key2: String?): String {
        var str: String?
        var strCPU = ""
        var cpuAddress = ""
        try {
            //Read CPU information
            val pp = Runtime.getRuntime().exec("cat /proc/cpuinfo")
            val ir = InputStreamReader(pp.inputStream)
            val input = LineNumberReader(ir)
            //Find the CPU serial number
            for (i in 1..99) {
                str = input.readLine()
                // println(str)
                if (str != null) {
                    //Find the line where the serial number is located
                    if (str.indexOf(key1) > -1) {
                        //Extract the serial number
                        strCPU = str.substring(str.indexOf(":") + 1,
                            str.length)

                        cpuAddress = strCPU.trim()
                        break
                    } else {
                        if (key2 != null) {
                            if (str.indexOf(key2) > -1) {
                                //Extract the serial number
                                strCPU = str.substring(str.indexOf(":") + 1,
                                    str.length)

                                cpuAddress = strCPU.trim()
                                break
                            }
                        }
                    }
                } else {
                    //End of file
                    break
                }
            }
        } catch (ex: java.lang.Exception) {
            //Give the default value
            ex.printStackTrace()
        }
        return cpuAddress
    }

    private fun getStringFromInputStream(`is`: InputStream): String {
        var br: BufferedReader? = null
        val sb = StringBuilder()
        var line: String?
        try {
            br = BufferedReader(InputStreamReader(`is`))
            while (br.readLine().also { line = it } != null) {
                sb.append(line)
            }
        } catch (e: IOException) {
            e.printStackTrace()
        } finally {
            if (br != null) {
                try {
                    br.close()
                } catch (e: IOException) {
                    e.printStackTrace()
                }
            }
        }
        return sb.toString()
    }

    private fun get64BitABIs(): List<String>? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            Build.SUPPORTED_64_BIT_ABIS.toList()
        } else {
            null
        }
    }

    private fun get32BitABIs(): List<String>? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            Build.SUPPORTED_32_BIT_ABIS.toList()
        } else {
            null
        }
    }

    private fun getNumberOfCores(): Int {
        return Runtime.getRuntime().availableProcessors()
    }

    private fun getNumCoresLegacy(): Int {
        class CpuFilter : FileFilter {
            override fun accept(pathname: File): Boolean {
                // Check if filename is "cpu", followed by a single digit number
                if (Pattern.matches("cpu[0-9]+", pathname.name)) {
                    return true
                }
                return false
            }
        }
        return try {
            val dir = File(CPU_INFO_DIR)
            val files = dir.listFiles(CpuFilter())
            files?.size ?: 1
        } catch (e: Exception) {
            1
        }
    }

    private fun getAbi(): List<String> {
        return if (Build.VERSION.SDK_INT >= 21) {
            Build.SUPPORTED_ABIS.toList()
        } else {
            @Suppress("DEPRECATION")
            listOf<String>(Build.CPU_ABI)
        }
    }

    private fun getCpuName(): String? {
        try {
            val fr = FileReader("/proc/cpuinfo")
            val br = BufferedReader(fr)
            val text = br.readLine()
            // println(text)
            br.close()
            val array = text.split(":\\s+", limit = 2).toTypedArray()
            if (array.size >= 2) {
                return array[1]
            }
        } catch (e: FileNotFoundException) {
            e.printStackTrace()
        } catch (e: IOException) {
            e.printStackTrace()
        }
        return null
    }

    private fun getSOC(): String {
        val soc = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            Build.SOC_MODEL
        } else {
            Build.BOARD
        }
        return soc
    }

    private fun getDisplayInfo(): Display {
        return Display(
            resolution = " ${context?.resources?.displayMetrics?.heightPixels} x${context?.resources?.displayMetrics?.widthPixels} ",
            density = getDisplayDensity(),
            fontScale = getFontScale(),
            screenSize = getScreenSize(),
            refreshRate = getScreenRefreshRate(),
            hdrCapabilities = getHDRCapabilities(),
            brightnessLevel = getDisplayBrightness(),
            screenTimeout = getDisplayTimeout(),
            orientation = getDeviceOrientation(),


            )
    }

    private fun getDeviceOrientation(): String {
        return when (context?.resources?.configuration?.orientation) {
            Configuration.ORIENTATION_PORTRAIT -> {
                "Portrait"
            }
            Configuration.ORIENTATION_LANDSCAPE -> {
                "Landscape"
            }
            else -> {
                "Undefined"
            }
        }

    }

    private fun getDisplayTimeout(): String {
        val timeout = Settings.System.getInt(context?.contentResolver,
            Settings.System.SCREEN_OFF_TIMEOUT)
        return timeout.toString()
    }

    private fun getDisplayBrightness(): String {
        var brightness = ""
        return if (checkSystemWritePermission()) {
            Settings.System.putInt(
                context?.contentResolver,
                Settings.System.SCREEN_BRIGHTNESS_MODE,
                Settings.System.SCREEN_BRIGHTNESS_MODE_MANUAL)

            brightness = Settings.System.getInt(context?.contentResolver,
                Settings.System.SCREEN_BRIGHTNESS,
                -1).toString()
            brightness
        } else {
            brightness
        }

    }

    private fun getHDRCapabilities(): String {
        val windowManager = context?.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        val display: android.view.Display? = windowManager.defaultDisplay
        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.N -> display?.hdrCapabilities.toString()
            else -> "not supported"
        }
    }

    private fun getScreenRefreshRate(): String {
        val windowManager = context?.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        val display: android.view.Display? = windowManager.defaultDisplay

        val refreshRating: Float = display?.refreshRate ?: 0.0.toFloat()
        return refreshRating.toString()
    }

    private fun getFontScale(): Double {
        var scale = 0.0
        try {
            if (checkSystemWritePermission()) {
                scale = context?.resources?.configuration?.fontScale?.toDouble()?:0.0
                return scale
            }
        } catch (e: Exception) {
            return scale
        }
        return scale
    }


    private fun checkSystemWritePermission(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (Settings.System.canWrite(context)) return true else openAndroidPermissionsMenu()
        }
        return false
    }

    private fun openAndroidPermissionsMenu() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val intent = Intent(Settings.ACTION_MANAGE_WRITE_SETTINGS)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            intent.data = Uri.parse("package:" + context?.packageName)
            context?.startActivity(intent)
        }
    }

    private fun getScreenSize(): String {
        val dm = DisplayMetrics()
        val windowManager = context?.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        windowManager.defaultDisplay.getMetrics(dm)

        val x = (dm.widthPixels / dm.xdpi).toDouble().pow(2.0)
        val y = (dm.heightPixels / dm.ydpi).toDouble().pow(2.0)
        var screenInches = sqrt(x + y)
        // Log.d("debug", "Screen inches : $screenInches")

        screenInches = (screenInches * 10).roundToInt().toDouble() / 10
        return screenInches.toString()
    }


    private fun getDisplayDensity(): String {
        val dm = DisplayMetrics()
        return when (context?.resources?.displayMetrics?.density?.toDouble()) {
            0.75 -> "${dm.densityDpi} (ldpi)"

            1.0 -> "${dm.densityDpi} (mdpi)"

            1.5 -> "${dm.densityDpi} (hdpi)"

            2.0 -> "${dm.densityDpi} (xhdpi)"

            3.0 -> "${dm.densityDpi} (xxhdpi)"

            4.0 -> "${dm.densityDpi} (xxxhdpi)"
            else -> "${dm.densityDpi} UNKNOWN"
        }
    }

    private fun getBatteryInfo(): Battery {
        val intent: Intent? =
            context?.registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
        return Battery(
            level = getBatteryPercentage(context = context!!),
            health = getBatteryHealth(intent = intent),
            status = getChargingStatus(intent = intent),
            powerSource = getBatteryPluggedStatus(intent = intent),
            technology = getBatteryTechnology(intent),
            temperature = getBatteryTemperature(intent),
            voltage = getBatteryVoltage(intent),
            powerProfile = getPowerProfile().toString()
        )
    }


    @SuppressLint("PrivateApi")
    private fun getPowerProfile(): Int {
        return when {
            Build.VERSION.SDK_INT >= 21 -> {
                val bm = context?.getSystemService(BATTERY_SERVICE) as BatteryManager
                bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CHARGE_COUNTER)
            }
            else -> {
                val mPowerProfile: Any
                val batteryCapacity: Double
                val powerprofileclass = "com.android.internal.os.PowerProfile"

                try {
                    mPowerProfile = Class.forName(powerprofileclass)
                        .getConstructor(Context::class.java)
                        .newInstance(context)
                    batteryCapacity = Class
                        .forName(powerprofileclass)
                        .getMethod("getBatteryCapacity")
                        .invoke(mPowerProfile) as Double
                    batteryCapacity.toInt()
                } catch (e: Exception) {
                    e.printStackTrace()
                    0
                }

            }
        }
    }

    private fun getBatteryVoltage(intent: Intent?): String {
        return when {
            intent != null -> {
                val voltage = intent.getIntExtra(BatteryManager.EXTRA_VOLTAGE, -1)
                voltage.toString()
            }
            else -> {
                "Null Intent"
            }
        }
    }

    private fun getBatteryTemperature(intent: Intent?): String {
        return when {
            intent != null -> {
                val temperature = intent.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, 0)
                return temperature.div(10).toString()
            }
            else -> {
                "Null Intent"
            }
        }
    }

    private fun getBatteryTechnology(intent: Intent?): String {
        return when {
            intent != null -> {
                val technology = intent.getStringExtra("technology")
                when {
                    technology != null -> {
                        return technology
                    }
                    else -> {
                        return "UNKNOWN"
                    }
                }
            }
            else -> {
                "Null Intent"
            }
        }
    }

    private fun getBatteryPluggedStatus(intent: Intent?): String {
        return when {
            intent != null -> {
                return when (intent.getIntExtra(BatteryManager.EXTRA_PLUGGED, -1)) {
                    BatteryManager.BATTERY_PLUGGED_USB -> "USB"
                    BatteryManager.BATTERY_PLUGGED_AC -> "AC"
                    BatteryManager.BATTERY_PLUGGED_WIRELESS -> "wireless"
                    else -> {
                        "unknown"
                    }
                }
            }
            else -> {
                "Null Intent"
            }
        }
    }

    private fun getChargingStatus(intent: Intent?): String {
        return when {
            intent != null -> {
                return when (intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)) {
                    BatteryManager.BATTERY_STATUS_CHARGING -> "charging"
                    BatteryManager.BATTERY_STATUS_FULL -> "full"
                    BatteryManager.BATTERY_STATUS_DISCHARGING -> "discharging"
                    else -> {
                        "unknown"
                    }
                }
            }
            else -> {
                "Null Intent"
            }
        }
    }

    private fun getBatteryHealth(intent: Intent?): String {
        return when {
            intent != null -> {
                when (intent.getIntExtra(BatteryManager.EXTRA_HEALTH, -1)) {
                    BatteryManager.BATTERY_HEALTH_GOOD -> "good"
                    BatteryManager.BATTERY_HEALTH_DEAD -> "dead"
                    BatteryManager.BATTERY_HEALTH_OVERHEAT -> "over_heat"
                    BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE -> "over_voltage"
                    BatteryManager.BATTERY_HEALTH_COLD -> "cold"
                    BatteryManager.BATTERY_HEALTH_UNSPECIFIED_FAILURE -> "unspecified_failure"
                    else -> {
                        "unknown"
                    }
                }
            }
            else -> {
                "Null Intent"
            }
        }
    }

    private fun getBatteryPercentage(context: Context): Int {
        return if (Build.VERSION.SDK_INT >= 21) {
            val bm = context.getSystemService(BATTERY_SERVICE) as BatteryManager
            bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        } else {
            val iFilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            val batteryStatus: Intent = context.registerReceiver(null, iFilter)!!
            val level = batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
            val scale = batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            val batteryPct = level / scale.toDouble()
            (batteryPct * 100).toInt()
        }
    }


    @SuppressLint("HardwareIds")
    fun getAndroid(): Android {
        return Android(
            androidversion = Build.VERSION.RELEASE,
            apiLevel = Build.VERSION.SDK_INT,
            androidSecurityPatchLevel = getSecurityPatch(),
            isDeviceRooted = RootUtil.isDeviceRooted,
            androidId = Secure.getString(context?.applicationContext?.contentResolver,
                Secure.ANDROID_ID),
            baseband = Build.getRadioVersion(),
            bootloader = Build.BOOTLOADER,
            buildId = Build.ID,
            codeName = Build.VERSION.CODENAME,
            fingerprint = Build.FINGERPRINT,
            id = Build.TAGS,
            incremental = Build.VERSION.INCREMENTAL,
            javaRuntimeVersion = System.getProperty("java.runtime.version"),
            javaVmVersion = System.getProperty("java.vm.version"),
            javaHeapSize = Runtime.getRuntime().maxMemory().toString(),
            kernelArchitecture = getKernelArchitecture(),
            kernelVersion = System.getProperty("os.version"),
            tags = Build.TAGS,
            buildType = Build.TYPE,
            googlePlayServiceVersion = "",
        )

    }


    private fun getDrmInfo(): DRMINFO {
        return DRMINFO(
            vendor = MediaDrm(wuuid).getPropertyString(MediaDrm.PROPERTY_VENDOR),
            version = MediaDrm(wuuid).getPropertyString(MediaDrm.PROPERTY_VERSION),
            description = MediaDrm(wuuid).getPropertyString(MediaDrm.PROPERTY_DESCRIPTION),
            algorithms = MediaDrm(wuuid).getPropertyString(MediaDrm.PROPERTY_ALGORITHMS),
            systemId = getSystemID(),
            securityLevel = getDRMSecurityLevel(),
            hdcpLevel = getHDCPLevel(),
            maxHdcpLevel = getMAXHDCPLevel(),
            usageRepostingSupport = getUsageReportingSupported(),
            maxNoOfSessions = getMAXNoOfSession(),
            noOfOpenSessions = getMAXNoOfOpenSession(),
        )
    }

    private fun ByteArray.toHexString() = joinToString("") { "%02x".format(it) }

    private fun getSystemID(): String {
        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                try {
                    MediaDrm(wuuid).getPropertyString(MediaDrm.PROPERTY_DEVICE_UNIQUE_ID)
                } catch (e: Exception) {
                    "unknown"
                }

            }
            else -> {
                val wIDEVINEUUID = UUID(-0x121074568629b532L, -0x5c37d8232ae2de13L)
                val wvDrm = MediaDrm(wIDEVINEUUID)
                val widevineId = wvDrm.getPropertyByteArray(MediaDrm.PROPERTY_DEVICE_UNIQUE_ID)
                val md = MessageDigest.getInstance("SHA-256")
                md.update(widevineId)
                return (md.digest()).toHexString()
            }

        }

    }

    private fun getDRMSecurityLevel(): String {

        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                when (MediaDrm.getMaxSecurityLevel()) {
                    0 -> "PROVISIONED"
                    1 -> "NOT_PROVISIONED"
                    2 -> "PROVISIONED_SD_ONLY"
                    else -> "Unknown"
                }
            }
            else -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.getPropertyString("securityLevel")
            }

        }

    }

    private fun getMAXHDCPLevel(): String {

        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.maxHdcpLevel.toString()
            }
            else -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.getPropertyString("maxHdcpLevel")
            }

        }
    }


    private fun getHDCPLevel(): String {

        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.connectedHdcpLevel.toString()
            }
            else -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.getPropertyString("hdcpLevel")
            }

        }
    }

    private fun getMAXNoOfSession(): String {

        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.maxSessionCount.toString()
            }
            else -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.getPropertyString("maxNumberOfSessions")
            }

        }
    }

    private fun getMAXNoOfOpenSession(): String {

        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.openSessionCount.toString()
            }
            else -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.getPropertyString("numberOfOpenSessions")
            }

        }
    }

    private fun getUsageReportingSupported(): String {

        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.getPropertyString("usageReportingSupport")
            }
            else -> {
                val mediaDrm = MediaDrm(wuuid)
                mediaDrm.getPropertyString("usageReportingSupport")
            }

        }
    }

    private fun getKernelArchitecture(): String {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
            listOf(Build.SUPPORTED_ABIS[0]).joinToString(separator = ",")
        else listOf("").joinToString(separator = ",")
    }

    fun getSytemFiles(): SystemFiles {
        val cpupath = "/proc/cpuinfo"
        val hostspath = "/system/etc/hosts"
        val memorypath = "/proc/meminfo"
        val systemfiles = SystemFiles(
            cpuInfo = SystemType(name = "CPU Information", path = cpupath, getFileInfo(cpupath)),

            hosts = SystemType(name = "Hosts ", path = hostspath, when {
                getFileInfo(hostspath) != null -> getFileInfo(hostspath)!!
                else -> "Error"
            }),
            memoryInfo = SystemType(name = "Memory Information ", path = memorypath, when {
                getFileInfo(memorypath) != null -> getFileInfo(memorypath)!!
                else -> "Error"
            })
        )
        //   println(systemfiles)
        return systemfiles
    }

    private fun getSecurityPatch(): String {
        return when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.M -> {
                Build.VERSION.SECURITY_PATCH
            }
            else -> {
                "Cannot determine android version less that API 23"
            }
        }
    }

    private fun getFileInfo(filepath: String): String? {
        val sb = StringBuffer()
        //
        when {
            File(filepath).exists() -> {
                try {
                    val br = BufferedReader(
                        FileReader(File(filepath))
                    )
                    var aLine: String
                    while (br.readLine().also { aLine = it } != null) {
                        sb.append(
                            """
                                $aLine
                                
                                """.trimIndent()
                        )
                    }
                    br.close()
                } catch (e: IOException) {
                    e.printStackTrace()
                    return null
                }
            }
            else -> {
                return null
            }
        }
        return sb.toString()
    }


}
