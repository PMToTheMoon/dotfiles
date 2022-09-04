part of 'otp_bloc.dart';

abstract class OTPEvent extends Equatable {
  const OTPEvent();

  @override
  List<Object> get props => [];
}

class OTPChanged extends OTPEvent {
  const OTPChanged({required this.index, required this.otp});

  final String otp;
  final int index;

  @override
  List<Object> get props => [index, otp];
}

class OTPSubmitted extends OTPEvent {}
