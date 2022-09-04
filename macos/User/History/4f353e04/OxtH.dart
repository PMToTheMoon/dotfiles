import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';
import 'package:model_generators/model_generators.dart';

final formController = FormController(formName: 'TestForm', fields: [
  FormControllerField(valueType, name, controller: TextFieldController())
]);

// final repo = Class((c) => c
//   ..name = 'RecordsRepository'
//   ..methods.add(
//     Method((m) => m
//       ..name = 'patientRecords'
//       ..returns = refer(
//         'List<Record>',
//         'package:output/records/records_repository.dart',
//       )
//       ..requiredParameters.add(
//         Parameter((p) => p
//           ..name = 'patientId'
//           ..type = refer('int')),
//       )),
//   ));

void main() async {
  await buildAll([
    Root('lib/', [
      JsonSerializable('test', {
        field('field', refer('int')),
        field('fieldB', refer('double')),
      }),
    ]),
  ]);

  // await step.build(
  //   Form(
  //     subject: 'Observation',
  //     root: 'lib/form',
  //     fields: [
  //       TextFormField('name'),
  //       TextFormField('lastName', label: refer('context.l10n.x ')),
  //     ],
  //   ),
  // );

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
