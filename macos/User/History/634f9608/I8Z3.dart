import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:tech_by_tech/candidate/widgets/candidate_menu_bar.dart';

class CandidatePageShell extends StatelessWidget {
  const CandidatePageShell({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return PageShell(
      menuBar: const CandidateMenuBar(),
      appBar: const TbtAppBar(
        notificationNumber: 1,
        avatar: NetworkImage(
          'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg',
        ),
      ),
      body: body,
    );
  }
}
