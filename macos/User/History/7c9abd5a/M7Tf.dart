import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'templates.dart';

part 'fetch_bloc.g.dart';
part '_fetch_bloc_data.dart';

MetaFetchBloc metaFetchBlocFactory(MetaObjectOptions options) =>
    MetaFetchBloc();

extension _EnumToBlocClass<T extends Enum> on Iterable {
  Map<String, Map<String, String>> asClassMap(String prefix) =>
      <String, Map<String, String>>{
        for (final value in this)
          value.name: {
            'name': value.name,
            'class': '$prefix${value.name.pascalCase}'
          }
      };
}

Map<String, Map<String, String>> asClassMap<T extends Enum>(
  Iterable values,
  String prefix,
) {
  return <String, Map<String, String>>{
    for (final value in values)
      value.name: {
        'name': value.name,
        'class': '$prefix${value.name.pascalCase}'
      }
  };
}

class MetaFetchBloc extends YamlMetaObject<FetchBlocOptions> {
  @override
  final String key = 'fetch_bloc';

  @override
  FetchBlocOptions dataFactory(Map input) => FetchBlocOptions.fromJson(input);

  @override
  FutureOr<void> build(BuildContext context, FetchBlocOptions data) async {
    final filePrefix = data.subject.snakeCase;
    final subject = data.subject.pascalCase;
    final states = asClassMap(_State.values, subject);
    final events = _Events.values.asClassMap(subject);

    final params = {
      'file_prefix': filePrefix,
      'bloc_subject': subject,
      'source': {
        'type': data.source.type,
        'name': data.source.type.camelCase,
        'fetch_function': data.source.fetchFunction,
      },
      'states': states,
      'events': events,
    };
    final content = renderTemplate(_blocTemplate, context.source.uri, params);
    await context.output('bloc/${filePrefix}_bloc.dart', content);
  }
}

enum _State {
  initial,
  fetching,
  ready,
  error;

  String call(String subject) => '$subject${name.pascalCase}';

  static Map toJson(String subject) => _State.values.asNameMap().map(
        (key, value) => MapEntry(key.snakeCase, {
          'name': value,
          'class': value.call(subject),
        }),
      );
}

@JsonEnum()
enum _Events {
  fetchRequested,
  fetchFailed,
  fetchSucceed;

  String call(String subject) => '$subject${name.pascalCase}';

  static Map toJson(String subject) => _Events.values.asNameMap().map(
        (key, value) => MapEntry(key.snakeCase, {
          'name': value,
          'class': value.call(subject),
        }),
      );
}
