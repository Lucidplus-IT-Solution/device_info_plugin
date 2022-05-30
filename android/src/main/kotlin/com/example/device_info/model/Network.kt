package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable
@Keep
@Serializable
data class Network(var telephony: Telephony, var wifi: WIFI?)
@Keep
@Serializable
data class Telephony(
    var phoneType: String? = null,
    var networkOperatorName: String? = null,
    var networkOperatorCode: String? = null,
    var networkOperatorCountry: String? = null,
    var simProviderName: String? = null,
    var simProviderCountry: String? = null,
    var simState: String? = null,
    var networkType: String? = null,
    var isDeviceRoaming: Boolean? = null,
)
@Keep
@Serializable
data class WIFI(
    var state: String?,
    var ssid: String?,
    var bssid: String?,
    var hiddenSsid: Boolean?,
    var ipv4Address: String?,
    var ipv6Address: String?,
    var signalStrength: String?,
    var linkSpeed: String?,
    var frequency: String?,
    var networkId: String?,
    var gateway: String?,
    var netmask: String?,
    var dns1: String?,
    var dhcpLeaseDuration: String?,
    var w5ghzBand: String?,
    var isWifiAware: Boolean?,
    var isWifiDirectAvailable: Boolean?,

    )
