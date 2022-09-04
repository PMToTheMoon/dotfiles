import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:neat/neat.dart';
import 'package:provider/provider.dart';

import 'package:zanalys/components/color_button.dart';
import 'package:zanalys/features/authentication/components/authentication_header.dart';
import 'package:zanalys/features/authentication/otp/bloc/otp_bloc.dart';
import 'package:zanalys/features/authentication/otp/ui/otp_textfield.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({Key? key}) : super(key: key);

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
              context.l10n.otp_title,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            context.bodyMedium(
              context.l10n.otp_description,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [1, 2, 3, 4, 5, 6, 7, 8]
                  .map(
                    (index) => Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: OTPTextField(
                          index: index,
                          isLast: index == 8,
                          onChanged: (text) {
                            context.read<OTPBloc>().otpChanged(index, text);
                            if (index < 8 &&
                                text != null &&
                                (text as String).isNotEmpty) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSubmitted: index < 8
                              ? null
                              : (text) => context.read<OTPBloc>().submit(),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 80),
            Center(
              child: ColorButton(
                label: context.l10n.otp_button,
                onPressed: () => context.read<OTPBloc>().submit(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
