import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
part 'establishment.g.dart';

@JsonSerializable()
class Establishment {
  const Establishment({required this.doctors});

  factory Establishment.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentFromJson(json);

  @JsonKey(name: 'medecins')
  final List<NetworkDoctor> doctors;
}
