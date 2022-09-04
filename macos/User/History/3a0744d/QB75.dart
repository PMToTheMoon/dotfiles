@JsonSerializable()
class Account {
  const Account();

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
