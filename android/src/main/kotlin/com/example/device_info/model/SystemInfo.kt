package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class SystemInfo(
    val manufacture: String,
    val model: String,
    val brand: String,
    val android: String,
    val apiLevel: String,
    val codeName:String,
    val density:String,
    val refreshRate:String,
    val product:String,
    val board:String,
    val build:String,
    val javaVmVersion:String,
    val security:String,
    val baseband:String,
    val serial:String,
    val buildType:String,
    val tags:String,
    val incremental:String,
    val fingerprint:String,
    val fingerprintManufacture:String,
    val fingerprintModel:String,
    val defaultOrientation:String,
    val bootloader:String,
    val selinux:String
)
