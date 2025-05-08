import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mmkv/mmkv.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSetting();
  runApp(const App());
}

Future<void> initSetting() async {
  final rootDir = await MMKV.initialize();
  print('MMKV for flutter with rootDir = $rootDir');
}
