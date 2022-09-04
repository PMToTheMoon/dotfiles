import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/app/router/router.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/storage/preferences_repository.dart';
import 'package:translations/translations.dart';

class TechByTechApp extends StatelessWidget {
  const TechByTechApp({
    super.key,
    required this.authRepository,
  });

  final AuthRepository authRepository;
  final PreferencesRepository preferencesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => authRepository),
        RepositoryProvider(create: (context) => preferencesRepository),
      ],
      child: BlocProvider(
        create: (blocContext) => AuthBloc(
          authRepository: blocContext.read(),
        ),
        child: AppRouter(
          appBuilder: (context, routerDelegate, routeInformationParser) =>
              MaterialApp.router(
            title: 'TechByTech',
            routerDelegate: routerDelegate,
            routeInformationParser: routeInformationParser,
            theme: lightTheme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        ),
      ),
    );
  }
}
