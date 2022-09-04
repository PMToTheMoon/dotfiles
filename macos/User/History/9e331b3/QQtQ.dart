part of 'records_bloc.dart';

@freezed
class RecordsState with _$RecordsState {
  // const factory RecordsState.initial() = RecordsInitial;

  const factory RecordsState.loading({List<String>? records}) = RecordsLoading;

  const factory RecordsState.success({List<String> records}) = RecordsSuccess;

  const factory RecordsState.error({List<String>? records}) = RecordsError;
}

// class RecordState {
//   final List<String>? records;

// }
