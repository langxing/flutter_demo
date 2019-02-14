package com.example.batterylevel

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

class BatteryPlugin {

    companion object {
        // 指定名称
        private val METHOD_NAME = "getBatteryLevel"
        // 通道名称
        private val CHANNEL = "flutter/battery"
        fun register(context: Context, messager: BinaryMessenger) {
            MethodChannel(messager, CHANNEL).setMethodCallHandler { methodCall, result ->
                // 判断调用的方法，是否是指定的方法
                if(methodCall?.method == METHOD_NAME) {
                    val battery =  getBatteryLevel(context)
                    if(battery != -1) {
                        result?.success(battery)
                    } else {
                        result?.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                } else {
                    result?.notImplemented()
                }
            }
        }

        /**
         * 获取电量
         */
        private fun getBatteryLevel(context: Context): Int {
            return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
                batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
            } else {
                val intent = ContextWrapper(context).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
                intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            }
        }
    }

}