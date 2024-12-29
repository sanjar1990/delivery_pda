package com.example.delivery_pda

import io.flutter.embedding.android.FlutterActivity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import android.util.Log
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.pda_scan_final/scanner"
    private lateinit var methodChannel: MethodChannel
    private lateinit var broadcastReceiver: BroadcastReceiver

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Set up the MethodChannel
        flutterEngine?.dartExecutor?.binaryMessenger?.let { messenger ->
            methodChannel = MethodChannel(messenger, CHANNEL)
        }

        // Set up the BroadcastReceiver
        broadcastReceiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent?) {
                intent?.let {
                    val barcode = it.getStringExtra("barcode")
                    Log.d("BroadcastTest", "Action: ${intent.action}")
                    Log.d("BroadcastTest", "Barcode: $barcode")

                    // Send the barcode to Flutter
                    barcode?.let { scannedBarcode ->
                        methodChannel.invokeMethod("onBarcodeScanned", scannedBarcode)
                    }
                }
            }
        }

        // Register the BroadcastReceiver
        val intentFilter = IntentFilter().apply {
            addAction("cn.kaicom.pda.action.receivescan")  // Adjust this action name if necessary
        }
        registerReceiver(broadcastReceiver, intentFilter)
    }

    override fun onDestroy() {
        super.onDestroy()
        unregisterReceiver(broadcastReceiver)
    }
}
