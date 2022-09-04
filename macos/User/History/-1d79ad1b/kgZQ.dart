part of 'ui_kit_page.dart';

List<Widget> get _buildRequestCards => [
      ZanalysRadio(selected: true),
      ZanalysRadio(selected: false),
      const RequestCard(
        type: RequestType.teleExpertise,
        from: 'John',
      ),
      const SpaceSmall.h(),
      const RequestCard(
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
