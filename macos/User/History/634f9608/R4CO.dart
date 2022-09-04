import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CandidatePageShell extends StatelessWidget {
  const CandidatePageShell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageShell(
      menuBar: TbtMenuBar(
        children: [
          const TbtMenuSectionTitle('GENERAL'),
          TbtMenuLink(Icons.table_chart_rounded, 'Dashboard', onTap: () {}),
          TbtMenuLink(Icons.library_add_check_rounded, 'Cooptations',
              onTap: () {}),
          const TbtMenuDivider(),
        ],
      ),
      appBar: appBar,
      body: body,
    );
  }
}
