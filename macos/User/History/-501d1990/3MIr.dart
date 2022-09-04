import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:translations/translations.dart';

typedef Validator<T> = String? Function(T? value);

abstract class Validators {
  static Validator<T> compose<T>(List<Validator<T>> validators) =>
      FormBuilderValidators.compose(validators);

  static Validator<T> required<T>(BuildContext context) =>
      FormBuilderValidators.required<T>(
        errorText: context.l10n.form_error_empty_field,
      );

  static Validator<T> required<T>(BuildContext context) =>
      FormBuilderValidators.required<T>(
        errorText: context.l10n.form_error_empty_field,
      );

  static Validator<String> email(BuildContext context) =>
      FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: context.l10n.form_error_empty_field,
        ),
        FormBuilderValidators.email(
          errorText: context.l10n.form_error_invalid_email,
        ),
      ]);
}
