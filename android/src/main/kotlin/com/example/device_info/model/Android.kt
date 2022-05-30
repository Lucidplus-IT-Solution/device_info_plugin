package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class Android(
    var androidversion:String,
    var apiLevel:Int,
    var androidSecurityPatchLevel:String,
    var isDeviceRooted:Boolean,
    var androidId:String,
    var baseband:String,
    var bootloader:String,
    var buildId:String,
    var codeName:String,
    var fingerprint:String,
    var id:String,
    var incremental:String,
    var javaRuntimeVersion: String?,
    var javaVmVersion: String?,
    var javaHeapSize:String,
    var kernelArchitecture:String,
    var kernelVersion: String?,
    var tags:String,
    var buildType:String,
    var googlePlayServiceVersion:String,
    var opensslVersion:String="",
    var zlibVersion:String="",
    var icuCldrVersion:String="",
    var icuLibraryVersion:String="",
    var icuUnicodeVersion:String="",
    var androidLanguage:String="",
    var configuredTimeZone:String=""
    )
