import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/auth/bloc/auth_bloc.dart';

class ProfilePageShell extends StatelessWidget {
  const ProfilePageShell({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingPage(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: body),
        ],
      ),
    );
  }
}
