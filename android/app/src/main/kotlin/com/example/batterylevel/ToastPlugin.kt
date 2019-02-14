package com.example.batterylevel

import android.content.Context
import android.text.TextUtils
import android.view.Gravity
import android.widget.Toast
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

class ToastPlugin {

    companion object {
        // 通道名称
        private val CHANNEL = "flutter/toast"
        val FUN_NAME = "showToast"
        val PARAMS_MESSAGE = "message"

        fun register(context: Context, messager: BinaryMessenger) {
            MethodChannel(messager, CHANNEL).setMethodCallHandler { call, result ->
                if(call?.method == FUN_NAME && !TextUtils.isEmpty(call.argument(PARAMS_MESSAGE))) {
                    val toast = Toast.makeText(context, call.argument<String>(PARAMS_MESSAGE), Toast.LENGTH_SHORT)
                    toast.setGravity(Gravity.CENTER, 0, 0)
                    toast.show()
                    result?.success(null)
                } else {
                    result?.notImplemented()
                }
            }
        }
    }

}