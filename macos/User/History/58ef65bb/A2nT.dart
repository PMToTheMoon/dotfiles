part of "new_passenger_page.dart";

class _NewPassengerFormController {
  _NewPassengerFormController({
    String? firstName,
    String? lastName,
    String? email,
    PhoneNumber? phoneNumber,
    this.onChanged,
  })  : _initialFirstName = firstName,
        _firstName = firstName,
        _initialLastName = lastName,
        _lastName = lastName,
        _initialEmail = email,
        _email = email,
        _initialPhoneNumber = phoneNumber,
        _phoneNumber = phoneNumber;

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

  String? get firstName => _firstName;
  void onFirstNameChanged(String? firstName) => _firstName = firstName;
  void onFirstNameSaved(String? firstName) {
    if (firstName == null) return;
    _firstName = firstName;
  }

  String? get lastName => _lastName;
  void onLastNameChanged(String? lastName) => _lastName = lastName;
  void onLastNameSaved(String? lastName) {
    if (lastName == null) return;
    _lastName = lastName;
  }

  String? get email => _email;
  void onEmailChanged(String? email) => _email = email;
  void onEmailSaved(String? email) {
    if (email == null) return;
    _email = email;
  }

  PhoneNumber? get phoneNumber => _phoneNumber;
  void onPhoneNumberChanged(PhoneNumber? phoneNumber) =>
      _phoneNumber = phoneNumber;
  void onPhoneNumberSaved(PhoneNumber? phoneNumber) {
    if (phoneNumber == null) return;
    _phoneNumber = phoneNumber;
  }

  void save() => _formKey.currentState?.save();

  void clear() => _formKey.currentState?.reset();

  bool validate() => _formKey.currentState?.validate() ?? false;
}
