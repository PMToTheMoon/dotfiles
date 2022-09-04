import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:zanalys_api/src/model/address.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Equatable {
  @JsonKey(name: 'numeroCompte')
  final String? id;
  @JsonKey(name: 'titre')
  final String? title;
  @JsonKey(name: 'prenom')
  final String? firstName;
  @JsonKey(name: 'nom')
  final String? lastName;
  @JsonKey(name: 'dateNaissance')
  final String? dateOfBirth;
  @JsonKey(name: 'adresse')
  final Address? address;
  @JsonKey(name: 'avatar')
  final String? avatar;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'telephoneFixe')
  final String? phone;
  @JsonKey(name: 'telephoneMobile')
  final String? mobilePhone;

  const User(
      this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.address,
      this.avatar,
      this.email,
      this.phone,
      this.mobilePhone);

  @override
  List<Object?> get props => [
        id,
        title,
        firstName,
        lastName,
        dateOfBirth,
        address,
        avatar,
        email,
        phone,
        mobilePhone
      ];

  static const empty = User('', '', '', '', '', Address.empty, '', '', '', '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
