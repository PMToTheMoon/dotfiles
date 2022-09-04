import 'package:flutter/material.dart' hide Page;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:neat/neat.dart';

import '/passengers/passengers.dart';
import '/user/user.dart';
import 'package:common/common.dart';
part '_passenger_form_controller.dart';

class NewPassengerPage extends StatelessWidget {
  static const String route = "/new_passenger";

  static Widget builder(BuildContext context) => const NewPassengerPage();

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

  const NewPassengerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPassengerBloc(
        userRepository: context.read(),
      ),
      child: const _NewPassengerPage(),
    );
  }
}

class _NewPassengerPage extends StatefulWidget {
  const _NewPassengerPage({
    Key? key,
  }) : super(key: key);

  @override
  _NewPassengerPageState createState() => _NewPassengerPageState();
}

class _NewPassengerPageState extends State<_NewPassengerPage> {
  _NewPassengerPageState();

  final _NewPassengerFormController controller =
      _NewPassengerFormController(onChanged: _onFormDataChanged);
  bool _enableSubmitButton = false;

  void _onFormDataChanged() {
    final enable = controller.firstName?.isNotEmpty == true &&
        controller.lastName?.isNotEmpty == true &&
        controller.lastName?.isNotEmpty == true &&
        controller.phoneNumber?.isNotEmpty == true;
  }

  void _onBlocChanged(BuildContext ctx, NewPassengerState state) {
    if (state is NewPassengerError) {
      showError(
        ctx,
        message: context.l10n.error_indicator_message,
      );
    }
    if (state is NewPassengerSuccess) Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Page(
      appBar: titledAppBar(
        context,
        title: context.l10n.new_passenger_page_title,
      ),
      body: BlocListener<NewPassengerBloc, NewPassengerState>(
        listener: _onBlocChanged,
        child: Column(
          children: [
            _NewPassengerForm(
              controller: controller,
              verticalGapBuilder: (_) => const Space4.h(),
            ),
            const Space3.h(),
            _FormSubmitButton(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

class _NewPassengerForm extends StatelessWidget {
  static const _noGap = SizedBox.shrink();

  const _NewPassengerForm({
    required this.controller,
    this.verticalGapBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    Key? key,
  }) : super(key: key);

  final _NewPassengerFormController controller;
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
            decoration: InputDecoration(
              hintText: context.l10n.first_name_hint,
              suffixIcon: const Icon(Icons.person),
            ),
            textInputAction: TextInputAction.next,
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
            decoration: InputDecoration(
              hintText: context.l10n.last_name_hint,
              suffixIcon: const Icon(Icons.person),
            ),
            textInputAction: TextInputAction.next,
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
            decoration: InputDecoration(
              hintText: context.l10n.new_passenger_email_hint,
              suffixIcon: const Icon(Icons.email),
            ),
            textInputAction: TextInputAction.next,
            initialValue: controller._initialEmail,
            onChanged: controller.onEmailChanged,
            onSaved: controller.onEmailSaved,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.email(
              context,
              errorText: context.l10n.bad_email_format_error,
            ),
          ),
          verticalGapBuilder?.call(context) ?? _noGap,
          IntlPhoneField(
            initialCountryCode:
                WidgetsBinding.instance?.window.locale.countryCode,
            initialValue: controller._initialPhoneNumber?.completeNumber,
            onChanged: controller.onPhoneNumberChanged,
            onSaved: controller.onPhoneNumberSaved,
            textInputAction: TextInputAction.send,
            decoration: InputDecoration(
              hintText: context.l10n.phone_hint,
              suffixIcon: const Icon(Icons.phone_iphone),
              counterText: "",
            ),
            invalidNumberMessage: context.l10n.invalid_phone_number_error,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                context,
                errorText: context.l10n.field_required_error,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _FormSubmitButton extends StatelessWidget {
  const _FormSubmitButton({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final _NewPassengerFormController controller;

  void _submitForm(BuildContext context) {
    if (controller.validate()) {
      context.read<NewPassengerBloc>().add(
            NewPassengerEvent.formSubmitted(
              data: NewPassengerFormData(
                firstName: controller.firstName?.trim() ?? "",
                lastName: controller.lastName?.trim() ?? "",
                phoneNumber:
                    controller.phoneNumber?.completeNumber.trim() ?? "",
                email: controller.email?.trim(),
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((NewPassengerBloc bloc) => bloc.state);
    final enableButton = controller.firstName?.isNotEmpty == true &&
        controller.lastName?.isNotEmpty == true &&
        controller.phoneNumber != null;

    late final Widget child;
    late final VoidCallback onPressed;
    if (state is NewPassengerApiRequest) {
      child = SizedBox(
        height: Dimensions.space4,
        width: Dimensions.space4,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: context.colorScheme.surface,
        ),
      );
      onPressed = () {};
    } else {
      child = Text(context.l10n.validate);
      onPressed = () => _submitForm(context);
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: Center(child: child),
    );
  }
}
