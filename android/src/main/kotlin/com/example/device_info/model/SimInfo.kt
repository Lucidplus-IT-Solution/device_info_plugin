package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable
@Keep
@Serializable
data class SimInfo(var sims:List<SIMType>)

@Keep
@Serializable
data class SIMType(
    var slotName: String,
    var simState: String,
    var lineNumber: String,
    var voicemailNumber: String,
    var serialNumberIccid: String,
    var operatorName: String,
    var operatorCodeMccMnc: String,
    var country: String,
    var softwareVersion: Int

)
