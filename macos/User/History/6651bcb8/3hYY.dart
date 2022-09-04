import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

enum ProfileTabs {
  user,
  professionalExperiences;

  String display(BuildContext context) {
    switch (this) {
      case ProfileTabs.user:
        return context.l10n.candidate_profile_tab_user;
      case ProfileTabs.professionalExperiences:
        return context.l10n.candidate_profile_tab_professional_experiences;
    }
  }

  void navigate(BuildContext context) {
    switch (this) {
      case ProfileTabs.user:
        return RouteState.of(context).goTo('/profile/user');
      case ProfileTabs.professionalExperiences:
        return RouteState.of(context).goTo('/profile/professional-experiences');
    }
  }

  static List<String> tabNames(BuildContext context) =>
      values.map((e) => e.display(context)).toList();
}

/// Todo: find a more generic system
int _initialTabIndex(BuildContext context) {
  final match = GlobalRouteState.of(context)?.match;
  if (match != null) {
    if (match.getLast()?.path == 'user') return 0;
    if (match.getLast()?.path == 'professional-experiences') return 1;
  }
  return 0;
}

class CandidateProfilePageShell extends StatefulWidget {
  static CandidateProfilePageShell builder(BuildContext context, Widget body) =>
      CandidateProfilePageShell(body: body);

  const CandidateProfilePageShell({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  State<CandidateProfilePageShell> createState() =>
      CandidateProfilePageShellState();
}

class CandidateProfilePageShellState extends State<CandidateProfilePageShell>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: ProfileTabs.values.length, vsync: this);

  void _onTabSelected(BuildContext context, int index) {
    ProfileTabs.values[index].navigate(context);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final index = _initialTabIndex(context);
        _tabController.animateTo(index);
      }
    });
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          // hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const PaddingPage(left | top | right),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.paddingMedium,
                      horizontal: Dimensions.paddingLarger,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        context.displaySmall(
                          context.l10n.candidate_profile_header_title,
                        ),
                        const SpaceSmallest.h(),
                        context.bodyLarge(
                          context.l10n.candidate_profile_header_text,
                          style: TextStyle(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TabCard(
                controller: _tabController,
                onTabSelected: (index) => _onTabSelected(context, index),
                tabBarPadding: const PaddingLarger.horizontal(),
                margin: const PaddingPage(),
                tabs: ProfileTabs.tabNames(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingLarger,
                    horizontal: Dimensions.paddingLarge,
                  ),
                  child: Column(
                    children: [
                      widget.body,
                      SliverFillRemaining(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
