part of 'fetch_bloc.dart';

@JsonSerializable()
class FetchBlocOptions {
  const FetchBlocOptions({
    required this.subject,
    required this.source,
    required this.data,
  });

  final String subject;

  final FetchBlocSource source;

  final Data data;

  factory FetchBlocOptions.fromJson(Map json) =>
      _$FetchBlocOptionsFromJson(json);
}

@JsonSerializable()
class FetchBlocSource {
  const FetchBlocSource({
    required this.type,
    required this.fetchFunction,
  });

  final String type;

  final String fetchFunction;

  factory FetchBlocSource.fromJson(Map json) => _$SourceFromJson(json);
}

@JsonSerializable()
class Data {
  const Data({
    required this.type,
  });

  final String type;

  factory Data.fromJson(Map json) => _$DataFromJson(json);
}
