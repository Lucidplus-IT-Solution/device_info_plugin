package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class Thermal(
    var cpuThermals: List<ThermalType>,
)
@Keep
@Serializable
data class ThermalType(var name: String, var temperature: String)
