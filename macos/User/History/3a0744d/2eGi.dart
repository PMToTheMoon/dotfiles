import 'user.dart';

@JsonSerializable()
class Account {
  const Account({
    required this.user,
  });

  final User user;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
