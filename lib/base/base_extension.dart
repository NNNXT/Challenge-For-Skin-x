// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// String
extension StringLocalization on String {
  String get imagePath => 'res/icons/$this';
}

//BuildContext
extension BuildContextProvide on BuildContext {
  T provide<T>({bool listen = true}) => Provider.of<T>(
        this,
        listen: listen,
      );

  void showToast({required String msg}) {
    Fluttertoast.showToast(msg: msg);
  }
}

// ScrollNotification
extension ScrollNotificationType on ScrollNotification {
  bool get isEndNotification => this is ScrollEndNotification;

  bool get isStartNotification => this is ScrollStartNotification;

  bool get isUpdateNotification => this is ScrollUpdateNotification;

  bool get isUserNotification => this is UserScrollNotification;

  bool get isLoadMoreNotification =>
      metrics.pixels > 0.0 && metrics.pixels >= metrics.maxScrollExtent && isEndNotification;
}
