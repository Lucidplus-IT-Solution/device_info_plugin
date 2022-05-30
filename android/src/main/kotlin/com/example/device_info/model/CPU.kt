package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable
@Keep
@Serializable
data class CPUInfo(
    var soc: String,
    var cpu: String?="UNKNOWN",
    var vendor: String?="UNKNOWN",
    var cores: String="UNKNOWN",
    var machines: String="UNKNOWN",
    var cpuClockRange: String="UNKNOWN",
    var cpuClocks: List<CPUCores>?= listOf(),
    var supportedAbis: List<String>? = listOf(),
    var supported32bitAbis: List<String>? = listOf(),
    var supported64bitAbis: List<String>? = listOf(),
    var instructions: List<String> = listOf(),
    var revision: String="UNKNOWN",
    var governer: String="UNKNOWN",
    var gpu: String="UNKNOWN",
    var gpuVendor: String="UNKNOWN",
    var gpuVersion: String="UNKNOWN",
    var openglExtensions: List<String> = listOf(),
    )
@Keep
@Serializable
data class CPUCores(var name: String, var frequency: Double)