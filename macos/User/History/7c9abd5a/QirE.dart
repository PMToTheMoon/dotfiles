import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_bloc_templates.dart';

part 'fetch_bloc.g.dart';
part '_fetch_bloc_data.dart';

MetaFetchBloc metaFetchBlocFactory(MetaObjectOptions options) =>
    MetaFetchBloc();

class MetaFetchBloc extends YamlMetaObject<FetchBlocOptions> {
  @override
  final String key = 'fetch_bloc';

  @override
  FetchBlocOptions dataFactory(Map input) => FetchBlocOptions.fromJson(input);

  @override
  FutureOr<void> build(BuildContext context, FetchBlocOptions data) async {
    final filePrefix = data.subject.snakeCase;
    final subject = data.subject.pascalCase;
    final states = _State.asClassMap(subject);
    final events = _Events.asClassMap(subject);

    final params = {
      'file_prefix': filePrefix,
      'bloc_class': '${subject}Bloc',
      'state_class': '${subject}State',
      'event_class': '${subject}Event',
      'states': states,
      'events': events,
      'source': {
        'type': data.source.type,
        'name': data.source.type.camelCase,
        'fetch_function': data.source.fetchFunction,
        'data': {
          'type': data.source.receivedObjectType,
          'name': data.source.receivedObjectType.camelCase
        }
      }
    };

    final blocFileContent =
        renderDartTemplate(_blocTemplate, context.source.uri, params);
    await context.output('bloc/${filePrefix}_bloc.dart', blocFileContent);
    await context.ipr('bloc/${filePrefix}_bloc.dart', blocFileContent);

    final stateFileContent =
        renderDartTemplate(_stateTemplate, context.source.uri, params);
    await context.output('bloc/${filePrefix}_state.dart', stateFileContent);

    final eventFileContent =
        renderDartTemplate(_eventTemplate, context.source.uri, params);
    await context.output('bloc/${filePrefix}_event.dart', eventFileContent);
  }
}

enum _State {
  initial,
  fetching,
  ready,
  error;

  static Map<String, Map<String, String>> asClassMap(String prefix) => {
        for (final v in values)
          v.name.snakeCase: {
            'class': '$prefix${v.name.pascalCase}',
            'ctr': '${prefix}State.${v.name}'
          }
      };
}

enum _Events {
  started;

  static Map<String, Map<String, String>> asClassMap(String prefix) => {
        for (final v in values)
          v.name.snakeCase: {
            'class': '$prefix${v.name.pascalCase}',
            'ctr': '${prefix}Event.${v.name}'
          }
      };
}
