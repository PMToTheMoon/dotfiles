part of 'records_bloc.dart';

abstract class Test {
  List<String>? records;
}

@freezed
class RecordsState with _$RecordsState {
  const RecordState._();

  // const factory RecordsState.initial() = RecordsInitial;

  @Implements<Test>()
  const factory RecordsState.loading({List<String>? records}) = RecordsLoading;

  @Implements<Test>()
  const factory RecordsState.success({required List<String> records}) =
      RecordsSuccess;

  @Implements<Test>()
  const factory RecordsState.error({List<String>? records}) = RecordsError;

  // List<String>? get records => whenOrNull(

  // );
}

class RecordState {
  final List<String>? records;
}
