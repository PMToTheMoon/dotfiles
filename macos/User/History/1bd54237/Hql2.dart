import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/app/router/router.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:translations/translations.dart';

class TechByTechApp extends StatelessWidget {
  const TechByTechApp({
    super.key,
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: BlocProvider(
        create: (blocContext) => AuthBloc(
          authRepository: blocContext.read(),
        )..add(const AuthEvent.started()),
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
