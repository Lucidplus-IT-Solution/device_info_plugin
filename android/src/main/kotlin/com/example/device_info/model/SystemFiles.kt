package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class SystemFiles(
    var cpuInfo: SystemType,
    var hosts: SystemType,
    var memoryInfo: SystemType,
)
@Keep
@Serializable
data class SystemType(var name: String, var path: String, var content: String?)