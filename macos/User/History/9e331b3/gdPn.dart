part of 'records_bloc.dart';

abstract class Test {
  List<String>? records;
}

@freezed
class RecordsState with _$RecordsState {
  const RecordsState._();

  // const factory RecordsState.initial() = RecordsInitial;

  const factory RecordsState.loading({List<String>? records}) = RecordsLoading;

  const factory RecordsState.success({required List<String> records}) =
      RecordsSuccess;

  const factory RecordsState.error({List<String>? records}) = RecordsError;

  List<String>? get records => whenOrNull<List<String>?>(
        loading: (records) => records,
        success: (records) => records,
        error: (records) => records,
      );
}
