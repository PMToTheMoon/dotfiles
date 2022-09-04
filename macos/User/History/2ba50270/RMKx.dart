import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/auth/signin/bloc/signin_bloc.dart';

class SignInKeepUserId extends StatefulWidget {
  final bool isSelected;

  const SignInKeepUserId({Key? key, required this.isSelected})
      : super(key: key);

  @override
  State<SignInKeepUserId> createState() => _SignInKeepUserIdState();
}

class _SignInKeepUserIdState extends State<SignInKeepUserId> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant SignInKeepUserId oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      setState(() {
        isSelected = widget.isSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateValue(!isSelected),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: isSelected,
              onChanged: (value) => _updateValue(value),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            context.l10n.sign_in_keep_save_id,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }

  _updateValue(bool? value) {
    bool newValue = value ?? false;
    context.read<SignInBloc>().updateKeepUserId(newValue);
    setState(() {
      isSelected = newValue;
    });
  }
}
