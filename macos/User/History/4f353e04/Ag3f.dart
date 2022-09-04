import 'package:bloc_generators/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

void main() {
  build(Form(
    root: 'lib/form',
    fields: [
      TextFormField('name'),
      TextFormField('lastName', label: 'context.l10n.x'),
    ],
  ));
  // build(
  //   FetchBloc(
  //     root: 'lib/home/bloc',
  //     subject: 'HomeRecords',
  //     source: const FetchBlocSource(
  //       dependency: CustomDependency(
  //         "import 'package:output/records/records_repository.dart';",
  //       ),
  //       type: 'RecordsRepository',
  //       fetchFunction: 'patientRecords',
  //       receivedType: 'List<Record>',
  //       parameters: Fields({
  //         Field('int', 'patientId', named: false),
  //       }),
  //     ),
  //   ),
  // );
}
