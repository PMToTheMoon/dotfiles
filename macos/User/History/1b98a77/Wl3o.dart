import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/authentication/otp/validators/otp.dart';

class OTPState extends Equatable {
  const OTPState({
    this.otp1 = const OTP.pure(),
    this.otp2 = const OTP.pure(),
    this.otp3 = const OTP.pure(),
    this.otp4 = const OTP.pure(),
    this.otp5 = const OTP.pure(),
    this.otp6 = const OTP.pure(),
    this.otp7 = const OTP.pure(),
    this.otp8 = const OTP.pure(),
    this.status = FormzStatus.pure,
  });

  final OTP otp1;
  final OTP otp2;
  final OTP otp3;
  final OTP otp4;
  final OTP otp5;
  final OTP otp6;
  final OTP otp7;
  final OTP otp8;

  final FormzStatus status;

  OTPState copyWith({
    OTP? otp1,
    OTP? otp2,
    OTP? otp3,
    OTP? otp4,
    OTP? otp5,
    OTP? otp6,
    OTP? otp7,
    OTP? otp8,
    FormzStatus? status,
  }) {
    return OTPState(
      otp1: otp1 ?? this.otp1,
      otp2: otp2 ?? this.otp2,
      otp3: otp3 ?? this.otp3,
      otp4: otp4 ?? this.otp4,
      otp5: otp5 ?? this.otp5,
      otp6: otp6 ?? this.otp6,
      otp7: otp7 ?? this.otp7,
      otp8: otp8 ?? this.otp8,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props =>
      [otp1, otp2, otp3, otp4, otp5, otp6, otp7, otp8, status];
}
