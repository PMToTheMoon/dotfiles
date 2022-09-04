import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Patient {
  const Patient({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  @JsonKey(name: 'numeroCompte')
  final String id;

  @JsonKey(name: 'prenom')
  final String firstName;

  @JsonKey(name: 'nom')
  final String lastName;
}
