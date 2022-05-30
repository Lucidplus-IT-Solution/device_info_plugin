package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class DRMINFO(
    var vendor:String="UNKNOWN",
    var version:String="UNKNOWN",
    var description:String="UNKNOWN",
    var algorithms:String="UNKNOWN",
    var systemId:String="UNKNOWN",
    var securityLevel:String="UNKNOWN",
    var hdcpLevel:String="UNKNOWN",
    var maxHdcpLevel:String="UNKNOWN",
    var usageRepostingSupport:String="UNKNOWN",
    var maxNoOfSessions:String="UNKNOWN",
    var noOfOpenSessions:String="UNKNOWN",
)
