import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  const Account({
    required this.user,
  });

  final User user;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
