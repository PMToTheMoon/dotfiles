part of 'fetch_bloc.dart';

@JsonSerializable()
class FetchBlocOptions {
  const FetchBlocOptions({
    required this.subject,
    required this.source,
    required this.data,
  });

  final String subject;

  final FetchBlocSourceOptions source;

  final Data data;

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

  factory FetchBlocSourceOptions.fromJson(Map json) => _$SourceFromJson(json);
}

@JsonSerializable()
class Data {
  const Data({
    required this.type,
  });

  final String type;

  factory Data.fromJson(Map json) => _$DataFromJson(json);
}
