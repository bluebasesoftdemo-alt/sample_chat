import 'package:flutter/material.dart';

class Log {
  static void i(dynamic data, {StackTrace? stackTrace}) {
    debugPrint("ChatApp:: $data");
  }
  static void d(dynamic data, {StackTrace? stackTrace}){
    debugPrint("ChatApp :: $data$stackTrace");
  }
  static void e(dynamic data, {StackTrace? stackTrace}){
    debugPrint("ChatApp :: $data$stackTrace");
  }
}

