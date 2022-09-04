import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:provider/provider.dart';
import 'package:zanalys/auth/components/authentication_header.dart';
import 'package:zanalys/auth/signin/bloc/signin_bloc.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            const AuthenticationHeader(),
            const SizedBox(height: 60),
            context.headlineMedium(
              context.l10n.sign_in_title,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            context.bodyMedium(
              context.l10n.sign_in_description,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 34),
            BasicTextField(
              initialValue: context.read<SignInBloc>().state.identifier.value,
              labelText: context.l10n.sign_in_hint_id,
              onChanged: (id) =>
                  context.read<SignInBloc>().identifierChanged(id),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),
            BasicTextField(
              labelText: context.l10n.sign_in_hint_password,
              onChanged: (password) =>
                  context.read<SignInBloc>().passwordChanged(password),
              onSubmitted: (password) => context.read<SignInBloc>().submit(),
            ),
            const RealHeightSizedBox(height: 22),
            SignInKeepUserId(
              isSelected: context.read<SignInBloc>().state.keepUserId.value,
            ),
            const SizedBox(height: 34),
            Center(
              child: ElevatedButton(
                child: Center(child: Text(context.l10n.sign_in_button)),
                onPressed: () => context.read<SignInBloc>().submit(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
