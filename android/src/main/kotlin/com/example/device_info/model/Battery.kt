package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class Battery(
    var level:Int,
    var health:String,
    var status:String,
    var powerSource:String,
    var technology:String,
    var temperature:String,
    var voltage:String,
    var powerProfile:String
)
