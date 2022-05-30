package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class Display(
    var resolution:String,
    var density:String,
    var fontScale:Double,
    var screenSize:String,
    var refreshRate:String,
    var hdrCapabilities:String,
    var brightnessLevel:String,
    var screenTimeout:String,
    var orientation:String
)
