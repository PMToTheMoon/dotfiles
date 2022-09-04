import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/auth/auth.dart';

Future<String?> authGuard(BuildContext context) async {
  final authState = context.read<AuthBloc>().state;
  return authState.mapOrNull(
    unauthenticated: (unauthenticated) => '/login',
  );
}
