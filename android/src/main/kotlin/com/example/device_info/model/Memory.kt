package com.example.device_info.model

import androidx.annotation.Keep
import kotlinx.serialization.Serializable

@Keep
@Serializable
data class Memory(
    var ram: MemoryTypeInfo?,
    var internal: MemoryTypeInfo?,
    var external: MemoryTypeInfo?
)
@Keep
@Serializable
data class MemoryTypeInfo(
    var name: String,
    var used: String,
    var free: String,
    var total: String
)
