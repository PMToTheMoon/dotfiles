import 'package:common/common.dart';
import 'package:flutter/material.dart';

class Hub extends StatelessWidget {
  static Future<void> open(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const Hub(),
        ),
      );

  const Hub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const _Hub();
  }
}

class _Hub extends StatelessWidget {
  const _Hub();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleSubtitleAvatarAppBar(
        context,
        title: context.l10n.initial_observation_page_title,
        subtitle: context.l10n.general_initial_observation_page_subtitle,
        image: AssetImage(Assets.images.launcherIcon.keyName),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            UnderlineTabBar(tabs: [
              'Observation',
              'Document',
              'Détails',
              'Discussion',
            ])
          ],
        ),
      ),
    );
  }
}
