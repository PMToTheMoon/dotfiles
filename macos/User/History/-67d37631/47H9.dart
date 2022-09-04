import 'package:app_client/auth/auth.dart';
import 'package:app_client/user/user.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:neat/neat.dart';

class ProfilePage extends StatelessWidget {
  static const String route = "/profile";

  static Widget builder(BuildContext context) => const ProfilePage();

  static Future<void> open(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(
        route,
      );

  static void goBack(
    BuildContext context,
  ) =>
      Navigator.of(context).pop();

  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ProfilePage();
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final infos = context.select((UserBloc bloc) => bloc.user.infos);

    return Page.noScroll(
      appBar: titledAppBar(
        context,
        title: context.l10n.profile_page_title,
      ),
      body: _UserInfos(userInfos: infos),
    );
  }
}

class _UserInfos extends StatelessWidget {
  const _UserInfos({
    required this.userInfos,
    Key? key,
  }) : super(key: key);

  final UserInfos userInfos;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Assets.images.urbanDriverURed.image(width: 89),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                context.headline5(userInfos.displayFirstName),
                const Space5.h(),
                context.headline5(userInfos.displayLastName),
              ],
            ),
          ),
        ]),
        const Space4.h(),
        const Divider(),
        const Space4.h(),
        PhoneMenuDisplay(
          countryCode: "lm",
          number: FlutterLibphonenumber().formatNumberSync(userInfos.mobileA),
          icon: Icons.phone_iphone,
        ),
        const Space4.h(),
        Button.menu(
          userInfos.email,
          null,
          icon: Icons.email,
          arrow: false,
          color: context.colorScheme.onSurface,
        ),
        const Space4.h(),
        Button.menu(
          context.l10n.profile_change_password_button,
          () => showSuccessDialog(
            context,
            message:
                "Un email de réinitialisation de mot de passe vous à été envoyé",
          ),
          icon: Icons.lock,
          color: context.colorScheme.onSurface,
        ),
        const Space1.h(),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Button.secondary(
              context.l10n.logout_button,
              () => context.read<AuthBloc>().add(const LogoutRequested()),
              style: ButtonStyle(
                foregroundColor: context.colorScheme.primary.msp,
              ),
            ),
          ),
        )
      ],
    );
  }
}
