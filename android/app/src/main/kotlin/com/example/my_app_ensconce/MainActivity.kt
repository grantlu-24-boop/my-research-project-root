package com.example.my_app_ensconce

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.example.my_app_ensconce.services.CaptureService
import com.example.my_app_ensconce.ui.FloatingBubbleService

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.my_app_ensconce/service"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startCaptureService" -> {
                    startService(Intent(this, CaptureService::class.java))
                    result.success(null)
                }
                "startBubbleService" -> {
                    startService(Intent(this, FloatingBubbleService::class.java))
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
