part of 'auth_service.dart';

class AuthenticationException implements Exception {}

class SessionExpired implements AuthenticationException {}
