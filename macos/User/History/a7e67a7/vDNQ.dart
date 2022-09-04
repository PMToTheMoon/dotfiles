import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';

class CandidateProfessionalInformation extends StatelessWidget {
  static CandidateProfessionalInformation builder(BuildContext context) =>
      const CandidateProfessionalInformation();

  const CandidateProfessionalInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SpaceSmall(),
          Text("Candidate professional information"),
          Text(RouteState.of(context).route.path),
        ],
      ),
    );
  }
}
