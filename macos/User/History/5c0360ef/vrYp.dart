import 'package:flutter/material.dart' hide Page;
import 'package:app_client/payment/payment.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  static const String route = "/payment";

  static Widget builder(BuildContext context) {
    try {
      final args =
          ModalRoute.of(context)!.settings.arguments as PaymentPageArguments;
      return PaymentPage(
        arguments: args,
      );
    } catch (_) {
      throw InvalidPageArguments<PaymentPage>();
    }
  }

  static Future<PaymentPageResult> open(
    BuildContext context,
    PaymentPageArguments arguments,
  ) async {
    final result = await Navigator.of(context).pushNamed(
      route,
      arguments: arguments,
    );
    return result as PaymentPageResult;
  }

  static void goBack(
    BuildContext context,
    PaymentPageResult result,
  ) =>
      Navigator.of(context).pop(result);

  const PaymentPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final PaymentPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentBloc>(
      create: (context) => PaymentBloc(
        transactionID: arguments.transactionID,
        reservationRepository: context.read(),
      ),
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PaymentSuccess) {
            goBack(context, const PaymentPageResult(success: true));
          } else if (state is PaymentRefused) {
            goBack(context, const PaymentPageResult(success: false));
          }
        },
        child: WillPopScope(
          onWillPop: () async => false,
          child: _PaymentPage(),
        ),
      ),
    );
  }
}

class _PaymentPage extends StatelessWidget {
  _PaymentPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((PaymentBloc bloc) => bloc.state);

    if (state is PaymentAuth3ds) {
      return WebViewPage(
        popScopeNavigationDelegate: () async => false,
        url: state.url,
      );
    }

    return const Page(
      alignment: Alignment.center,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
