part of 'fetch_bloc.dart';

@JsonSerializable()
class MetaFetchBlocData {
  const MetaFetchBlocData({
    required this.subject,
    required this.source,
  });

  final String subject;

  final _Source source;

  // final _Data data;

  factory MetaFetchBlocData.fromJson(Map json) =>
      _$MetaFetchBlocDataFromJson(json);
}

@JsonSerializable()
class _Source {
  const _Source({
    required this.type,
    required this.fetchFunction,
  });

  final String type;

  final String fetchFunction;

  factory _Source.fromJson(Map json) => _$SourceFromJson(json);
}
