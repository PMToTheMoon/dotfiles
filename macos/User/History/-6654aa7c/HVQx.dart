import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:zanalys_api/src/model/user.dart';

part 'session.g.dart';

@JsonSerializable(explicitToJson: true)
class Session extends Equatable {
  final String refreshToken;
  @JsonKey(name: 'principal')
  final String token;
  final User user;

  const Session(this.token, this.refreshToken, this.user);

  @override
  List<Object> get props => [refreshToken, user, token];

  static const empty = Session('', '', User.empty);

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
