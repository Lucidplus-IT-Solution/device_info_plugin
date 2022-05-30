package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class AndroidDeviceInfo(
    val system: SystemInfo?,
    val cpu: CPUInfo?,
    val android: Android?,
    val drmInfo: DRMINFO?,
    var memory: Memory?,
    var camera: CameraInfos?,
    var battery: Battery?,
    var display: Display?,
    var thermal: Thermal?,
    var network: Network?,
    var simInfo: SimInfo?,
    var systemFile: SystemFiles?,

    )
