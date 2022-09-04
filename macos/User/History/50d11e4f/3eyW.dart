import 'package:app_client/sign_in/sign_in.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neat/neat.dart';
import 'package:app_client/login/login.dart';
import 'package:common/common.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  static const route = "/login";
  static Widget builder(_) => const LoginPage();

  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read(),
      ),
      child: Page.noScroll(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginUnexpectedErrorState) {
              showError(context, message: context.l10n.try_later_error);
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Assets.images.urbanDriver.image(),
                    Expanded(
                      child: Align(
                        alignment: const Alignment(0, -0.25),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Space3.h(),
                              const RoundContainer(
                                child: LoginForm(),
                              ),
                              Button.text(context.l10n.login_sign_in_link,
                                  () => SignInPage.open(context),
                                  color: Color(0xff6A7D70)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (MediaQuery.of(context).viewInsets.bottom == 0)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: FutureBuilder(
                    future: getAppInfoString(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return context.bodyText2(snapshot.data as String);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
