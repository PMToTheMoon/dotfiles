import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';

class CandidateMenuBar extends StatelessWidget {
  const CandidateMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TbtMenuBar(
      children: [
        const TbtMenuSectionTitle('GENERAL'),
        TbtMenuLink(
          Icons.widgets_rounded,
          'UI Kit',
          onTap: () => RouteState.of(context).goTo('/ui-kit'),
        ),
        TbtMenuLink(
          Icons.table_chart_rounded,
          'Dashboard',
          onTap: () => RouteState.of(context).goTo('/dashboard'),
        ),
        TbtMenuLink(Icons.library_add_check_rounded, 'Cooptations',
            onTap: () {}),
        const TbtMenuDivider(),
      ],
    );
  }
}
