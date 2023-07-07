import 'package:flutter/material.dart';
import 'package:test_smena/app/app.dart';
import 'package:test_smena/app/configs.dart';
import 'package:test_smena/layers/repositories/repository.dart';
import 'package:test_smena/layers/storage/storage.dart';

Future<void> main() async {
  await AppStorage.init();
  ApiRepository.setConfig(defaultConfig);
  runApp(const TestSmenaApp());
}
