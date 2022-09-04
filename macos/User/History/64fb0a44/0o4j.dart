import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';

import 'package:zanalys/app/services.dart';
import 'package:zanalys/data/model/session.dart';
import 'package:zanalys/auth/otp/validators/otp.dart';

part 'otp_state.dart';
part 'otp_event.dart';

class OTPBloc extends Bloc<OTPEvent, OTPState> {
  OTPBloc({required this.identifier, required this.password})
      : super(const OTPState()) {
    on<OTPChanged>(_onOTPChanged);
    on<OTPSubmitted>(_onOTPSubmitted);
  }

  final String identifier;
  final String password;

  void _onOTPChanged(OTPChanged event, Emitter<OTPState> emit) {
    final otp = OTP.dirty(event.otp);
    switch (event.index) {
      case 1:
        emit(state.copyWith(
          otp1: otp.valid ? otp : OTP.pure(event.otp),
          status: Formz.validate([
            otp,
            state.otp2,
            state.otp3,
            state.otp4,
            state.otp5,
            state.otp6,
            state.otp7,
            state.otp8
          ]),
        ));
        break;
      case 2:
        emit(state.copyWith(
          otp2: otp.valid ? otp : OTP.pure(event.otp),
          status: Formz.validate([
            state.otp1,
            otp,
            state.otp3,
            state.otp4,
            state.otp5,
            state.otp6,
            state.otp7,
            state.otp8
          ]),
        ));
        break;
      case 3:
        emit(state.copyWith(
          otp3: otp.valid ? otp : OTP.pure(event.otp),
          status: Formz.validate([
            state.otp1,
            state.otp2,
            otp,
            state.otp4,
            state.otp5,
            state.otp6,
            state.otp7,
            state.otp8
          ]),
        ));
        break;
      case 4:
        emit(state.copyWith(
          otp4: otp.valid ? otp : OTP.pure(event.otp),
          status: Formz.validate([
            state.otp1,
            state.otp2,
            state.otp3,
            otp,
            state.otp5,
            state.otp6,
            state.otp7,
            state.otp8
          ]),
        ));
        break;
      case 5:
        emit(state.copyWith(
          otp5: otp.valid ? otp : OTP.pure(event.otp),
          status: Formz.validate([
            state.otp1,
            state.otp2,
            state.otp3,
            state.otp4,
            otp,
            state.otp6,
            state.otp7,
            state.otp8
          ]),
        ));
        break;
      case 6:
        emit(state.copyWith(
          otp6: otp.valid ? otp : OTP.pure(event.otp),
          status: Formz.validate([
            state.otp1,
            state.otp2,
            state.otp3,
            state.otp4,
            state.otp5,
            otp,
            state.otp7,
            state.otp8
          ]),
        ));
        break;
      case 7:
        emit(state.copyWith(
          otp7: otp.valid ? otp : OTP.pure(event.otp),
          status: Formz.validate([
            state.otp1,
            state.otp2,
            state.otp3,
            state.otp4,
            state.otp5,
            state.otp6,
            otp,
            state.otp8
          ]),
        ));
        break;
      case 8:
        emit(state.copyWith(
          otp8: otp.valid ? otp : OTP.pure(event.otp),
          status: Formz.validate([
            state.otp1,
            state.otp2,
            state.otp3,
            state.otp4,
            state.otp5,
            state.otp6,
            state.otp7,
            otp,
          ]),
        ));
        break;
    }
  }

  void _onOTPSubmitted(OTPSubmitted event, Emitter<OTPState> emit) async {
    final otp1 = OTP.dirty(state.otp1.value);
    final otp2 = OTP.dirty(state.otp2.value);
    final otp3 = OTP.dirty(state.otp3.value);
    final otp4 = OTP.dirty(state.otp4.value);
    final otp5 = OTP.dirty(state.otp5.value);
    final otp6 = OTP.dirty(state.otp6.value);
    final otp7 = OTP.dirty(state.otp7.value);
    final otp8 = OTP.dirty(state.otp8.value);

    emit(state.copyWith(
      otp1: otp1,
      otp2: otp2,
      otp3: otp3,
      otp4: otp4,
      otp5: otp5,
      otp6: otp6,
      otp7: otp7,
      otp8: otp8,
      status: Formz.validate([otp1, otp2, otp3, otp4, otp5, otp6, otp7, otp8]),
    ));
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final String otp = otp1.value +
          otp2.value +
          otp3.value +
          otp4.value +
          otp5.value +
          otp6.value +
          otp7.value +
          otp8.value;

      try {
        final success = await AppServices.auth
            .validateOTP(identifier: identifier, password: password, code: otp);
        if (success) {
          await _sendPushToken();
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  _sendPushToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        await AppServices.user.updatePushToken(token: token);
      }
    } catch (e) {
      print(e);
    }
  }

  void otpChanged(int index, String otp) {
    add(OTPChanged(index: index, otp: otp));
  }

  void submit() {
    add(OTPSubmitted());
  }
}
