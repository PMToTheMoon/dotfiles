import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:provider/src/provider.dart';
import 'package:zanalys/components/basic_textfield.dart';
import 'package:zanalys/components/color_button.dart';
import 'package:zanalys/features/authentication/components/authentication_header.dart';
import 'package:zanalys/features/authentication/signin/bloc/signin_bloc.dart';
import 'package:zanalys/generated/locale_keys.g.dart';
import 'package:zanalys/resources/app_styles.dart';

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
            context.titleMedium(
              LocaleKeys.sign_in_title.tr(),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.sign_in_description.tr(),
              textAlign: TextAlign.start,
              style: AppStyles.authenticationDescription(context),
            ),
            const SizedBox(height: 34),
            BasicTextField(
              labelText: LocaleKeys.sign_in_hintId.tr(),
              onChanged: (id) =>
                  context.read<SignInBloc>().identifierChanged(id),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 24),
            BasicTextField(
              labelText: LocaleKeys.sign_in_HintPassword.tr(),
              onChanged: (password) =>
                  context.read<SignInBloc>().passwordChanged(password),
              onSubmitted: (password) => context.read<SignInBloc>().submit(),
            ),
            const SizedBox(height: 34),
            Center(
              child: ColorButton(
                label: LocaleKeys.sign_in_button.tr(),
                onPressed: () => context.read<SignInBloc>().submit(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
