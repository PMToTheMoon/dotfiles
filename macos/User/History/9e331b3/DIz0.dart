part of 'records_bloc.dart';

@freezed
class RecordsState with _$RecordsState {
  const RecordsState._();

  const factory RecordsState.initial(
      {required String id,
      required int page,
      String? name,
      DateTime? before,
      DateTime? after}) = RecordsInitial;

  const factory RecordsState.loading(
      {double? records,
      required int page,
      String? name,
      DateTime? before,
      DateTime? after}) = RecordsLoading;

  const factory RecordsState.success(
      {required double records,
      required int page,
      String? name,
      DateTime? before,
      DateTime? after}) = RecordsSuccess;

  const factory RecordsState.error(
      {double? records,
      required int page,
      String? name,
      DateTime? before,
      DateTime? after}) = RecordsError;

  double? get records => mapOrNull<double?>(
      loading: (s) => s.records,
      success: (s) => s.records,
      error: (s) => s.records);
}
