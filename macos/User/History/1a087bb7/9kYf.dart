import 'package:flutter/material.dart' hide Page;
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';

import 'package:common/common.dart';
import '/external_pages/external_pages.dart';
import '/sign_in/sign_in.dart';
import '/auth/auth.dart';

part '_sign_in_form_controller.dart';

class SignInPage extends StatelessWidget {
  static const String route = "/sign_in";

  static Widget builder(BuildContext context) => const SignInPage();

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

  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _SignInPage();
  }
}

class _SignInPage extends StatefulWidget {
  const _SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<_SignInPage> {
  _SignInPageState();

  late final _controller = _SignInFormController(onChanged: _onFormDataChanged);

  bool _enableSubmitButton = false;

  void _onFormDataChanged() {
    final enable = _controller.firstName?.isNotEmpty == true &&
        _controller.lastName?.isNotEmpty == true &&
        _controller.email?.isNotEmpty == true &&
        _controller.phoneNumber != null &&
        _controller.password?.isNotEmpty == true &&
        _controller.validate() == true;
    if (enable != _enableSubmitButton) {
      setState(() {
        _enableSubmitButton = enable;
      });
    }
  }

  void _onSubmitForm() {
    if (_controller.validate()) {
      PinCodePage.open(
        context,
        signInFormData: SignInFormData(
          lastName: _controller.lastName ?? "",
          firstName: _controller.firstName ?? "",
          email: _controller.email ?? "",
          phoneNumber: _controller.phoneNumber?.completeNumber ?? "",
          password: _controller.password ?? "",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Page(
      appBar: logoAppBar(context),
      body: Column(children: [
        context.headline5(
          context.l10n.sign_in_page_title,
          style: TextStyle(
            color: context.colorScheme.onSurface,
          ),
        ),
        const Space2.h(),
        RoundContainer(
          child: Column(
            children: [
              _SignInForm(
                controller: _controller,
                verticalGapBuilder: (_) => const Space4.h(),
              ),
              const Space2.h(),
              Align(
                alignment: Alignment.centerRight,
                child: SubmitButton(
                  label: context.l10n.sign_in_button,
                  onSubmit: _onSubmitForm,
                  loading: false,
                  enabled: _enableSubmitButton,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _SignInForm extends StatelessWidget {
  static const _noGap = SizedBox.shrink();

  const _SignInForm({
    required this.controller,
    this.verticalGapBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    Key? key,
  }) : super(key: key);

  final _SignInFormController controller;
  final Widget Function(BuildContext context)? verticalGapBuilder;

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller._formKey,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.l10n.first_name_hint,
              suffixIcon: const Icon(Icons.person),
            ),
            initialValue: controller._initialFirstName,
            onChanged: controller.onFirstNameChanged,
            onSaved: controller.onFirstNameSaved,
            validator: FormBuilderValidators.required(
              context,
              errorText: context.l10n.field_required_error,
            ),
          ),
          verticalGapBuilder?.call(context) ?? _noGap,
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.l10n.last_name_hint,
              suffixIcon: const Icon(Icons.person),
            ),
            initialValue: controller._initialLastName,
            onChanged: controller.onLastNameChanged,
            onSaved: controller.onLastNameSaved,
            validator: FormBuilderValidators.required(
              context,
              errorText: context.l10n.field_required_error,
            ),
          ),
          verticalGapBuilder?.call(context) ?? _noGap,
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.l10n.email_hint,
              suffixIcon: const Icon(Icons.email),
            ),
            initialValue: controller._initialEmail,
            onChanged: controller.onEmailChanged,
            onSaved: controller.onEmailSaved,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                context,
                errorText: context.l10n.field_required_error,
              ),
              FormBuilderValidators.email(
                context,
                errorText: context.l10n.bad_email_format_error,
              ),
            ]),
          ),
          verticalGapBuilder?.call(context) ?? _noGap,
          IntlPhoneField(
            textInputAction: TextInputAction.next,
            initialValue: controller._initialPhoneNumber?.completeNumber,
            initialCountryCode:
                WidgetsBinding.instance?.window.locale.countryCode,
            onChanged: controller.onPhoneNumberChanged,
            onSaved: controller.onPhoneNumberSaved,
            invalidNumberMessage: context.l10n.invalid_phone_number_error,
            decoration: InputDecoration(
              hintText: context.l10n.phone_hint,
              counterText: "",
              suffixIcon: const Icon(Icons.phone_iphone),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                context,
                errorText: context.l10n.field_required_error,
              ),
              (phoneNumber) {
                if (phoneNumber?.countryCode == "+33") {
                  if (phoneNumber?.number.startsWith(RegExp(r"[67]")))
                }
              }
            ]),
          ),
          verticalGapBuilder?.call(context) ?? _noGap,
          PasswordFormField(
            textInputAction: TextInputAction.done,
            initialValue: controller._initialPassword,
            onChanged: controller.onPasswordChanged,
            onSaved: controller.onPasswordSaved,
            validator: (p) => rgpdPassword(context, p),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          CheckboxListTileFormField(
            initialValue: false,
            onChanged: controller.onTermsOfUseChanged,
            onSaved: controller.onTermsOfUseSaved,
            contentPadding: EdgeInsets.zero,
            dense: true,
            errorColor: context.theme.errorColor,
            activeColor: context.colorScheme.primary,
            title: Row(
              children: [
                Text(context.l10n.accept_terms_of_use),
                Button.text(
                  context.l10n.open_terms_of_use_button,
                  () => TermsOfUsePage.open(context),
                )
              ],
            ),
            validator: FormBuilderValidators.equal(
              context,
              true,
              errorText: context.l10n.should_accept_term_of_use_error,
            ),
          ),
        ],
      ),
    );
  }
}
