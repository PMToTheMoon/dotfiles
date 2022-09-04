part of 'records_bloc.dart';

@freezed
class RecordsState with _$RecordsState {
  const RecordsState._();

  const factory RecordsState.initial() = RecordsInitial;

  const factory RecordsState.loading(
      {List<String>? records, required int page}) = RecordsLoading;

  const factory RecordsState.success(
      {required List<String> records, required int page}) = RecordsSuccess;

  const factory RecordsState.error({List<String>? records, required int page}) =
      RecordsError;

  List<String>? get records => mapOrNull<List<String>?>(
      loading: (records) => records,
      success: (records) => records,
      error: (records) => records);
}
