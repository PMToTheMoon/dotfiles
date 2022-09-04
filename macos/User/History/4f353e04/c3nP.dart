import 'package:bloc_generators/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

final repo = Class((c) => c
  ..name = 'RecordsRepository'
  ..methods.add(
    Method((m) => m
      ..name = 'patientRecords'
      ..returns = refer(
        'List<Record>',
        'package:output/records/records_repository.dart',
      )
      ..requiredParameters.add(
        Parameter((p) => p
          ..name = 'patientId'
          ..type = refer('int')),
      )),
  ));

void main() async {
  await build((BuildStep step) async {
    await step.build(Form(
      subject: 'Observation',
      root: 'lib/form',
      fields: [
        TextFormField('name'),
        TextFormField('lastName', label: refer('context.l10n.x ')),
      ],
    ));
  });
  // build(
  //   FetchBloc(
  //     root: 'lib/home/bloc',
  //     subject: 'HomeRecords',
  //     source: BlocSource(
  //       repository: repo,
  //       methodName: 'patientRecords',
  //     ),
  //   ),
  // );
}
