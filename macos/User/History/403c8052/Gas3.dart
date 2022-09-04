import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:models/models.dart';

import 'doctor_consultation_request_controller.dart';
import 'doctor_consultation_request_data.dart';

class DoctorConsultationRequestTile extends StatefulWidget {
  const DoctorConsultationRequestTile({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    this.controller,
    super.key,
  });

  final ImageProvider avatar;
  final String firstName;
  final String lastName;
  final DoctorConsultationRequestTileController? controller;

  @override
  State<DoctorConsultationRequestTile> createState() =>
      _DoctorConsultationRequestTileState();
}

class _DoctorConsultationRequestTileState
    extends State<DoctorConsultationRequestTile> {
  late final _effectiveController =
      widget.controller ?? DoctorConsultationRequestTileController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _effectiveController.toggle,
      child: ValueListenableBuilder(
        valueListenable: _effectiveController,
        builder: (context, DoctorConsultationRequestTileData state, _) =>
            Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: _DoctorIdentity(
                    state: state,
                    avatar: widget.avatar,
                    firstName: widget.firstName,
                    lastName: widget.lastName,
                  ),
                ),
                ZanalysRadio(selected: state.selectedRequestType != null),
              ],
            ),
            if (state is DoctorConsultationRequestTileUnfold)
              const SpaceSmaller.h(),
            if (state is DoctorConsultationRequestTileUnfold)
              _DoctorOptions(
                controller: _effectiveController,
                selected: state.selectedRequestType,
              ),
          ],
        ),
      ),
    );
  }
}

class _DoctorIdentity extends StatelessWidget {
  const _DoctorIdentity({
    required this.avatar,
    required this.state,
    required this.firstName,
    required this.lastName,
  });

  final ImageProvider avatar;
  final String firstName;
  final String lastName;
  final DoctorConsultationRequestTileData state;

  @override
  Widget build(BuildContext context) {
    final subtitle = state is DoctorConsultationRequestTileFold
        ? state.selectedRequestType?.display(context)
        : null;
    return Identity(
      avatar: avatar,
      firstName: firstName,
      lastName: lastName,
      subtitle: subtitle,
    );
  }
}

class _DoctorOptions extends StatelessWidget {
  const _DoctorOptions({
    required this.controller,
    this.selected,
  });

  final RequestType? selected;
  final DoctorConsultationRequestTileController controller;

  void _onPressed(RequestType type) {
    controller.selectRequestType(type);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: RequestType.values
          .map<Widget>(
            (type) {
              final text = Text(type.display(context));
              void onPressed() => _onPressed(type);
              return Expanded(
                child: type == selected
                    ? HighlightedOutlinedButton(
                        onPressed: onPressed,
                        child: text,
                      )
                    : OutlinedButton(
                        onPressed: onPressed,
                        child: text,
                      ),
              );
            },
          )
          .intersperse(const SpaceSmaller.w())
          .toList(),
    );
  }
}
