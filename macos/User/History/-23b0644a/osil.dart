@JsonSerializable()
class MetaFetchBlocData {
  const MetaFetchBlocData({
    required this.subject,
    required this.source,
  });

  final String subject;

  final Source source;

  // final _Data data;

  factory MetaFetchBlocData.fromJson(Map json) =>
      _$MetaFetchBlocDataFromJson(json);
}

@JsonSerializable()
class Source {
  const Source({
    required this.type,
    required this.fetchFunction,
  });

  final String type;

  final String fetchFunction;

  factory Source.fromJson(Map json) => _$SourceFromJson(json);
}
