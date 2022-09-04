part of 'home_records_bloc.dart';import 'package:freezed_annotation/freezed_annotation.dart';part 'home_records_event.freezed.dart';@freezed class HomeRecordsEvent with _$HomeRecordsEvent {const factory HomeRecordsEvent.fetchRequested() = HomeRecordsFetchRequested;

 }
