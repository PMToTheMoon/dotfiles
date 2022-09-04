import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:translations/translations.dart';

typedef Validator<T> = String? Function(T? value);

abstract class Validators {
  static Validator<T> compose<T>(List<Validator<T>> validators) =>
      FormBuilderValidators.compose(validators);

  // ignore: prefer_function_declarations_over_variables
  static final none = (_) => null;

  /// A validator that execute a callback to get the effective validator
  /// for this validation run.
  /// This is useful when a validator depend on dynamic value that can change
  /// without triggering re-build, for example other fields controller
  static Validator<T> dynamic<T>(Validator<T> Function() delegate) =>
      (T? value) => delegate().call(value);

  static Validator<T> required<T>(BuildContext context) =>
      FormBuilderValidators.required<T>(
        errorText: context.l10n.form_error_empty_field,
      );

  static Validator<String> dateString(BuildContext context) =>
      FormBuilderValidators.dateString(
        errorText: context.l10n.form_error_empty_field,
      );

  static Validator<String> dateFormat(BuildContext context, DateFormat format) =>
      (String? value) {
        try {
          format.parse(value!);
          return null;
        }
      };

  static Validator<DateTime> isBefore(BuildContext context, DateTime date) =>
      (DateTime? value) => value?.isBefore(date) != true
          ? context.l10n.form_error_date_is_not_after(date)
          : null;

  static Validator<DateTime> isAfter(BuildContext context, DateTime date) =>
      (DateTime? value) => value?.isAfter(date) != true
          ? context.l10n.form_error_date_is_not_before(date)
          : null;

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
