package com.example.batterylevel

import android.os.Bundle
import android.widget.Toast
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    Toast.makeText(this, "调用Android", Toast.LENGTH_SHORT).show()
    BatteryPlugin.register(this, flutterView)
    ToastPlugin.register(this, flutterView)
  }

}
