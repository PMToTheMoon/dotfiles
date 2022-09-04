import 'package:bloc_generators/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

void main() {
  build(Form(
    fields: [
      TextFormField('name'),
      TextFormField('lastName', label: 'Test'),
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
