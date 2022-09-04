import 'package:bonemeal/bonemeal.dart';
import 'package:bloc_generators/bloc_generators.dart';

final _source = Method(($) => $
  ..returns = refer('Future<List<String>>')
  ..name = 'recordList'
  ..requiredParameters.add(param('id', refer('String')))
  // ..optionalParameters.addAll([
  //   param('page', refer('int')),
  //   param('name', refer('String?')),
  //   param('before', refer('DateTime?')),
  //   param('after', refer('DateTime?')),
  // ])
  ..modifier = MethodModifier.async);

class TbtRepositoryItem extends RepositoryItem {
  TbtRepositoryItem({
    required this.name,
    required this.client,
    required this.error,
    required Set<Parameter> parameters,
    required this.type,
  }) : parameters = Parameters(parameters);

  @override
  final String name;

  final String client;
  final String error;
  final Parameters parameters;
  final Reference type;

  @override
  Iterable<Field> get fields => [];

  @override
  Iterable<Method> get methods => [
        fetchMethod,
      ];

  @override
  RepositorySource meta(Reference repository) =>
      RepositoryFutureSourceImpl(repository, fetchMethod);

  Method get fetchMethod {
    final body = refer('_$client')
        .property(name)
        .callWithResolver(SelfReferResolver(), parameters)
        .property('then')
        .call([refer("(r) => r.unwrapOrThrow('$error')")], {})
        .returned
        .statement;

    return Method(
      (m) => m
        ..name = name
        ..returns = type
        ..requiredParameters.addAll(parameters.allRequired)
        ..optionalParameters.addAll(parameters.allOptional)
        ..body = Block.of([body]),
    );
  }
}

class TbtRepository extends Seed {
  TbtRepository({
    required this.subject,
    required this.items,
  });

  final String subject;
  final Iterable<TbtRepositoryItem> items;

  @override
  MetaObject grow(BuildContext context) {
    return Repository(
      constructor: constructor,
      subject: subject,
      items: items,
      fields: serviceFields,
    );
  }

  Constructor get constructor {
    return Constructor(
      (c) => c
        ..optionalParameters.add(
          namedParam(
            'authRepository',
            refer('AuthRepository', 'package:tech_by_tech/auth/auth.dart'),
          ),
        )
        ..initializers.addAll(serviceInitializers),
    );
  }

  Iterable<String> get clients => items.map((e) => e.client).toSet();

  Iterable<Code> get serviceInitializers => clients.map(
      (client) => Code('_$client = authRepository.tbtPrivateClient.$client'));

  Iterable<Field> get serviceFields => clients.map((client) => field('_$client',
      refer('${client.pascalCase}Service', 'package:tbt_api/tbt_api.dart')));
}
