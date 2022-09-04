part of 'create_record_bloc.dart';

@freezed
class CreateRecordState with _$CreateRecordState {
  const CreateRecordState._();

  const factory CreateRecordState.initial() = CreateRecordInitial;
  const factory CreateRecordState.create({
    required NewRecord record,
  }) = CreateRecordCreate;
  const factory CreateRecordState.success({
    String recordId,
  }) = CreateRecordSuccess;
  const factory CreateRecordState.error() = CreateRecordError;
}
