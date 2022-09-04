// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CandidateService extends CandidateService {
  _$CandidateService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CandidateService;

  @override
  Future<Response<UserAccount>> candidate(String id) {
    final $url = '/candidates/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserAccount, UserAccount>($request);
  }
}
