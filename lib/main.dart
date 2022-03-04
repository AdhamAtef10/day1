import 'package:day1/services/dio/dio_service.dart';
import 'package:day1/services/shared-prefrence/cache_helper.dart';
import 'package:day1/src/app_root.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(const AppRoot());
}
