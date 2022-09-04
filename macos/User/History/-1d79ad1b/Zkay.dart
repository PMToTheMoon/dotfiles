part of 'ui_kit_page.dart';

List<Widget> get _buildRequestCards => [
      Row(children: [
        ZanalysRadio(selected: true),
        ZanalysRadio(selected: false),
      ]),
      const RequestCard(
        type: ServiceType.teleExpertise,
        from: 'John',
      ),
      const SpaceSmall.h(),
      const RequestCard(
        type: ServiceType.teleConsultation,
        from: 'John',
      ),
      SpaceSmall.h(),
      DoctorConsultationRequestTile(
        avatar: AssetImage(Assets.images.launcherIcon.keyName),
        firstName: "Pierre",
        lastName: "Martin",
      ),
    ];
