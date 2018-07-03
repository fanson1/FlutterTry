package com.example.b2c;

import android.os.Bundle;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    // 注册MethodChannel便于dart调用
    new MethodChannel(getFlutterView(), "src.utils/ToastImpl")
        .setMethodCallHandler(new MethodChannel.MethodCallHandler() {
          @Override
          public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
            if ("show".equals(methodCall.method)) {
              String text = methodCall.argument("text");
              int duration = methodCall.argument("duration");
              Toast.makeText(MainActivity.this, text, duration).show();
            }
          }
        });
  }
}
