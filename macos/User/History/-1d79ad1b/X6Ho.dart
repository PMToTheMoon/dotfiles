part of 'ui_kit_page.dart';

List<Widget> get _buildRequestCards => [
      RequestCard(
        type: RequestType.teleExpertise,
        from: 'John',
      ),
      SpaceSmall.h(),
      RequestCard(
        type: RequestType.consultation,
        from: 'John',
      ),
      SpaceSmall.h(),
      DoctorConsultationRequestTile(
        avatar: AssetImage(Assets.images.launcherIcon.keyName),
        firstName: "Pierre",
        lastName: "Martin",
      ),
    ];
