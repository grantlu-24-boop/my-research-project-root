package com.example.my_app_ensconce.ai

import android.util.Log

class MLLMClient {
    fun processText(text: String): String {
        Log.d("MLLMClient", "Processing text: $text")
        return "Processed: $text"
    }
}
