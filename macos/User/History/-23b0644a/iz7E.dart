part of 'fetch_bloc.dart';

@JsonSerializable()
class FetchBlocOptions {
  const FetchBlocOptions({
    required this.subject,
    required this.source,
  });

  final String subject;

  final FetchBlocSourceOptions source;

  factory FetchBlocOptions.fromJson(Map json) =>
      _$FetchBlocOptionsFromJson(json);
}

@JsonSerializable()
class FetchBlocSourceOptions {
  const FetchBlocSourceOptions({
    required this.type,
    required this.fetchFunction,
  });

  final String type;

  final String fetchFunction;

  final String receivedType;

  factory FetchBlocSourceOptions.fromJson(Map json) =>
      _$FetchBlocSourceOptionsFromJson(json);
}
