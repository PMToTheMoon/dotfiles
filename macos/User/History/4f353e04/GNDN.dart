import 'package:bloc_generators/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

final repo = Class((c) => c
  ..methods.add(
    Method((m) => m
      ..name = 'patientRecords'
      ..returns = refer('List<Record>')
      ..requiredParameters.add(
        Parameter((p) => p
          ..name = 'patientId'
          ..type = refer('int')),
      )),
  ));

void main() {
  build(
    Form(
      subject: 'Observation',
      root: 'lib/form',
      dependencies: const Dependencies([
        CustomDependency("import 'package:common/common.dart';"),
      ]),
      fields: [
        TextFormField('name'),
        TextFormField('lastName', label: 'context.l10n.x '),
      ],
    ),
  );
  build(
    FetchBloc(
      root: 'lib/home/bloc',
      subject: 'HomeRecords',
      source: BlocSource(
        repository: repo,
        methodName: 'patientRecords',
      ),
      // source: const BlocSource(
      //   dependency: CustomDependency(
      //     "import 'package:output/records/records_repository.dart';",
      //   ),
      //   type: 'RecordsRepository',
      //   fetchFunction: 'patientRecords',
      //   receivedType: 'List<Record>',
      //   parameters: Fields({
      //     Field('int', 'patientId', named: false),
      //   }),
      // ),
    ),
  );
}
