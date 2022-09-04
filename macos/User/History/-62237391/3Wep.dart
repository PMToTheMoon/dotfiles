part of 'create_record_bloc.dart';

@freezed
class CreateRecordEvent with _$CreateRecordEvent {
  const CreateRecordEvent._();

  const factory CreateRecordEvent.creationRequested({
    required NewRecord record,
  }) = CreateRecordCreationRequested;

  const factory CreateRecordEvent.creationSucceeded() =
      CreateRecordCreationSucceeded;

  const factory CreateRecordEvent.creationFailed() = CreateRecordCreationFailed;
}
