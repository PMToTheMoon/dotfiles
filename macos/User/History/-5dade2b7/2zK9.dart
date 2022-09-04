import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Patient {
  @JsonKey(name: 'numeroCompte')
  final String id;

  @JsonKey(name: 'prenom')
  final String firstName;

  @JsonKey(name: 'nom')
  final String lastName;
}
