import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

import 'package:tech_by_tech/user/user_account/user_account.dart';

import 'widgets/user_personal_information_form.dart';

class UserAccountView extends StatelessWidget {
  static UserAccountView builder(BuildContext context) =>
      const UserAccountView();

  const UserAccountView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userAccountState =
        context.select((UserAccountBloc bloc) => bloc.state);
    return userAccountState.whenOrNull(
          ready: (userAccount) => _UserAccountView(
            account: userAccount,
          ),
        ) ??
        const SizedBox.shrink();
    return BlocBuilder<UserAccountBloc, UserAccountState>(
      builder: (context, state) => _UserAccountView(
        account: userAccount,
      ),
    );
  }
}

class _UserAccountView extends StatefulWidget {
  const _UserAccountView({
    required this.account,
  });

  final UserAccount account;

  @override
  State<_UserAccountView> createState() => _UserAccountViewState();
}

class _UserAccountViewState extends State<_UserAccountView> {
  late final UserPersonalInformationFormController _userAccountFormController;

  @override
  void initState() {
    super.initState();
    _userAccountFormController = UserPersonalInformationFormController(
      firstName: widget.account.firstName,
      lastName: widget.account.lastName,
      email: widget.account.email,
      phone: widget.account.phoneNumber,
    );
  }

  void _onInformationChanged() {
    if (_userAccountFormController.validate()) {
      final snapshot = _userAccountFormController.snapshot();
      context.read<UserAccountBloc>().add(
            UserAccountEvent.informationEdited(
              update: UserAccountInformationUpdate(
                firstName: snapshot.firstName,
                lastName: snapshot.lastName,
                email: snapshot.email,
                phoneNumber: snapshot.phone,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatarBuilder(
          builder: (avatar) => CircleAvatar(
            foregroundImage: avatar,
            radius: 46,
          ),
        ),
        const SpaceLarger.w(),
        SizedBox(
          width: 520,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserPersonalInformationForm(
                controller: _userAccountFormController,
                onChanged: _onInformationChanged,
              )
            ],
          ),
        ),
      ],
    );
  }
}
