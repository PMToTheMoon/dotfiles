import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/app/router.dart';
import 'package:tech_by_tech/app/splash_page.dart';
import 'package:tech_by_tech/auth/auth.dart';

import 'package:tech_by_tech/candidate/candidate_home_page.dart';

// import 'package:tech_by_tech/app/routes.dart';
import 'package:translations/translations.dart';

class TechByTechApp extends StatelessWidget {
  TechByTechApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (blocContext) => AuthBloc(
          authRepository: blocContext.read(),
        ),
        child: const AppRouter(),
      ),
    );
  }
}
