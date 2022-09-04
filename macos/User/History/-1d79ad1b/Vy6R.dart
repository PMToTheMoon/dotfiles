part of 'ui_kit_page.dart';

List<Widget> get _buildRequestCards => const [
      RequestCard(
        type: RequestType.teleExpertise,
        from: 'John',
      ),
      SpaceSmall.h(),
      RequestCard(
        type: RequestType.consultation,
        from: 'John',
      ),
    ];
