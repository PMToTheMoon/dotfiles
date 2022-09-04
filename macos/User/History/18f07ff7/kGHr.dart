import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:zanalys/components/color_button.dart';
import 'package:zanalys/components/real_height_sizedbox.dart';
import 'package:zanalys/features/authentication/components/authentication_header.dart';
import 'package:zanalys/features/authentication/otp/bloc/otp_bloc.dart';
import 'package:zanalys/features/authentication/otp/ui/otp_textfield.dart';
import 'package:zanalys/generated/locale_keys.g.dart';
import 'package:zanalys/resources/app_styles.dart';
import 'package:zanalys/utils/size_utils.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp(context)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            const AuthenticationHeader(),
            const SizedBox(height: 60),
            Text(
              LocaleKeys.otp_title.tr(),
              textAlign: TextAlign.start,
              style: AppStyles.authenticationTitle(context),
            ),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.otp_description.tr(),
              textAlign: TextAlign.start,
              style: AppStyles.authenticationDescription(context),
            ),
            const SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [1, 2, 3, 4, 5, 6, 7, 8]
                  .map(
                    (index) => Flexible(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.sp(context)),
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
                label: LocaleKeys.otp_button.tr(),
                onPressed: () => context.read<OTPBloc>().submit(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
