part of "sign_in_page.dart";

class _SignInFormController {
  _SignInFormController({
    String? firstName,
    String? lastName,
    String? email,
    PhoneNumber? phoneNumber,
    String? password,
    bool? termsOfUse,
    this.onChanged,
  })  : _initialFirstName = firstName,
        _firstName = firstName,
        _initialLastName = lastName,
        _lastName = lastName,
        _initialEmail = email,
        _email = email,
        _initialPhoneNumber = phoneNumber,
        _phoneNumber = phoneNumber,
        _initialPassword = password,
        _password = password,
        _initialTermsOfUse = termsOfUse,
        _termsOfUse = termsOfUse;

  final _formKey = GlobalKey<FormState>();
  final VoidCallback? onChanged;

  final String? _initialFirstName;
  String? _firstName;
  final String? _initialLastName;
  String? _lastName;
  final String? _initialEmail;
  String? _email;
  final PhoneNumber? _initialPhoneNumber;
  PhoneNumber? _phoneNumber;
  final String? _initialPassword;
  String? _password;
  final bool? _initialTermsOfUse;
  bool? _termsOfUse;

  String? get firstName => _firstName;
  void onFirstNameChanged(String? firstName) {
    _firstName = firstName;
    onChanged?.call();
  }

  void onFirstNameSaved(String? firstName) {
    if (firstName == null) return;
    _firstName = firstName;
  }

  String? get lastName => _lastName;
  void onLastNameChanged(String? lastName) {
    _lastName = lastName;
    onChanged?.call();
  }

  void onLastNameSaved(String? lastName) {
    if (lastName == null) return;
    _lastName = lastName;
  }

  String? get email => _email;
  void onEmailChanged(String? email) {
    _email = email;
    onChanged?.call();
  }

  void onEmailSaved(String? email) {
    if (email == null) return;
    _email = email;
  }

  PhoneNumber? get phoneNumber => _phoneNumber;
  void onPhoneNumberChanged(PhoneNumber? phoneNumber) {
    _phoneNumber = phoneNumber;
    onChanged?.call();
  }

  void onPhoneNumberSaved(PhoneNumber? phoneNumber) {
    if (phoneNumber == null) return;
    _phoneNumber = phoneNumber;
  }

  String? get password => _password;
  void onPasswordChanged(String? password) {
    _password = password;
    onChanged?.call();
  }

  void onPasswordSaved(String? password) {
    if (password == null) return;
    _password = password;
  }

  bool? get termsOfUse => _termsOfUse;
  void onTermsOfUseChanged(bool? termsOfUse) {
    _termsOfUse = termsOfUse;
    onChanged?.call();
  }

  void onTermsOfUseSaved(bool? termsOfUse) {
    if (termsOfUse == null) return;
    _termsOfUse = termsOfUse;
  }

  void save() => _formKey.currentState?.save();

  void clear() => _formKey.currentState?.reset();

  bool validate() => _formKey.currentState?.validate() ?? false;
}
