package com.example.device_info.CMDs

import java.io.IOException
import java.io.InputStream

internal class CMDExecute {
    @Synchronized
    @Throws(IOException::class)
    fun run(cmd: Array<String?>): String {
        var result = ""
        try {
            val builder = ProcessBuilder(*cmd)
            builder.redirectErrorStream(true)
            val process = builder.start()
            val `in`: InputStream = process.inputStream
            val re = ByteArray(1024)
            while (`in`.read(re) !== -1) {
                println(String(re))
                result += String(re)
            }
            `in`.close()
        } catch (ex: Exception) {
            ex.printStackTrace()
        }
        return result
    }
}