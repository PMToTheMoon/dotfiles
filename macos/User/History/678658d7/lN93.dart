import 'package:flutter/material.dart';
import 'package:tech_by_tech/app/app.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/storage/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageService = await initStorageService();
  final authRepository = AuthRepository(storageService: storageService);

  runApp(TechByTechApp(
    authRepository: authRepository,
  ));
}