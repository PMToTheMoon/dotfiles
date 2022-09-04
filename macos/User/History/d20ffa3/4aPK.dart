import 'package:flutter/material.dart';
import 'package:tech_by_tech/app/app.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/candidate/candidate_repository.dart';
import 'package:tech_by_tech/storage/preferences_repository.dart';
import 'package:tech_by_tech/storage/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageService = await initStorageService();

  final preferencesRepository =
      PreferencesRepository(storageService: storageService);

  final authRepository = await AuthRepository(
    storageService: storageService,
    preferencesRepository: preferencesRepository,
  ).init();

  final candidateRepository = CandidateRepository(
    authRepository: authRepository,
  );

  runApp(TechByTechApp(
    preferencesRepository: preferencesRepository,
    authRepository: authRepository,
  ));
}
