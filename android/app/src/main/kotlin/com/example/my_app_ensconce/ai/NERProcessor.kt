package com.example.my_app_ensconce.ai

import android.util.Log

class NERProcessor {
    fun extractEntities(text: String): List<String> {
        Log.d("NERProcessor", "Extracting entities from: $text")
        return listOf("Entity1", "Entity2") // Temporary dummy data
    }
}
