import 'package:day1/services/dio/dio_service.dart';
import 'package:day1/src/app_root.dart';
import 'package:flutter/material.dart';

void main() {

  DioHelper.init();
  runApp(const AppRoot());
}
