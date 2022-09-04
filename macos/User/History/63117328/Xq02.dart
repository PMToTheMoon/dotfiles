import 'package:flutter/material.dart';

final theme = ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: AppColors.primary.toMaterialColor(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(systemOverlayStyle: SystemUiOverlayStyle.dark),
      ),