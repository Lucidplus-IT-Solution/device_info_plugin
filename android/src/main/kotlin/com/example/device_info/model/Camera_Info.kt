package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class CameraInfos(
    var cameras:List<Cameras?>
)
@Keep
@Serializable
data class Cameras(
    var name:String,
    var resolution:String,
    var videoResolution:String,
    var orientation:String,
    var focalLength:String,
    var focusModes:List<String>,
    var videoSnapshotSupported:Boolean,
    var videoStabilizationSupported:Boolean,
    var zoomSupported:Boolean,
    var smoothZoomSupported:Boolean,
    var autoExposureLockingSupported:Boolean,
    var autoWhiteBalanceLockingSupported:Boolean,
    var flashSupported:Boolean
)