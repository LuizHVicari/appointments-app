package com.example.patients

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.BatteryManager
import android.content.Context

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.patients/channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        .setMethodCallHandler{ call, result -> 

            if (call.method == "getBattery") {
                val battery = "100"
                val bm: BatteryManager = context.getSystemService(BATTERY_SERVICE) as BatteryManager
                val batLevel: Int = bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
                if (batLevel == -1) {
                    result.error("Error", "Could not get battery level", null)
                }
                result.success(batLevel.toString())
            } else {
                result.notImplemented()
            }
        } 
    }
}
