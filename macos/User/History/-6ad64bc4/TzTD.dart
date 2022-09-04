part of 'home_records_bloc.dart';


import 'package:freezed_annotation/freezed_annotation.dart';part 'home_records_state.freezed.dart';@freezed class HomeRecordsState with _$HomeRecordsState {const factory HomeRecordsState.initial() = HomeRecordsInitial;

const factory HomeRecordsState.fetching() = HomeRecordsFetching;

const factory HomeRecordsState.ready({required List<Record> data}) = HomeRecordsReady;

const factory HomeRecordsState.error() = HomeRecordsError;

 }
