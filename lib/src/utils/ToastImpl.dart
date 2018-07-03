import 'package:flutter/services.dart';

  const _toast = const MethodChannel("src.utils/ToastImpl");

  const int _LENGTH_SHORT = 0;
  const int _LENGTH_LONG = 1;

/**
 *
 * 展示Toast
 */
void show(String text, int duration) async {
    try {
      await _toast.invokeMethod("show", { 'text': text, 'duration': duration });
    } on Exception catch ( e ) {
      print(e);
    } on Error catch ( e ) {
      print(e);
    }
  }

/**
 *
 * 展示短Toast
 */
  void showShort(String text) {
    show(text, _LENGTH_SHORT);
  }

/**
 *
 * 展示长Toast
 */
  void showLong(String text) {
    show(text, _LENGTH_LONG);
  }

