import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';

export 'doctor_consultation_request_controller.dart';
export 'doctor_consultation_request_data.dart';

class DoctorConsultationRequestTile extends StatefulWidget {
  const DoctorConsultationRequestTile({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    this.controller,
    this.initialState,
    this.onTap,
    this.onSelected,
    this.onUnselected,
    super.key,
  }) : assert(initialState == null || controller == null);

  final ImageProvider avatar;

  final String firstName;

  final String lastName;

  final DoctorConsultationRequestTileData? initialState;
  final DoctorConsultationRequestTileController? controller;

  final VoidCallback? onTap;
  final ValueChanged<ServiceType>? onSelected;
  final VoidCallback? onUnselected;

  @override
  State<DoctorConsultationRequestTile> createState() =>
      _DoctorConsultationRequestTileState();
}

class _DoctorConsultationRequestTileState
    extends State<DoctorConsultationRequestTile> {
  late final _effectiveController = widget.controller ??
      DoctorConsultationRequestTileController(
        initialState: widget.initialState,
      );

  @override
  void initState() {
    super.initState();
  }

  void _onTap() {
    widget.onTap?.call();
    _effectiveController.toggle();
  }

  void _onRadioTapped() {
    if (_effectiveController.value.requestSelected) {
      widget.onUnselected?.call();
      _effectiveController.deselectRequest(fold: true);
    } else {
      _onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: context.colorScheme.surface,
      child: InkWell(
        onTap: _onTap,
        child: Padding(
          padding: const PaddingSmall(),
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
                    ZanalysRadio(
                      selected: state.selectedRequestType != null,
                      onTap: _onRadioTapped,
                    ),
                  ],
                ),
                if (state is DoctorConsultationRequestTileUnfold)
                  const SpaceSmaller.h(),
                if (state is DoctorConsultationRequestTileUnfold)
                  _DoctorOptions(
                    controller: _effectiveController,
                    selected: state.selectedRequestType,
                    onSelected: widget.onSelected,
                    onUnselected: widget.onUnselected,
                  ),
              ],
            ),
          ),
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
    this.onSelected,
    this.onUnselected,
  });

  final ServiceType? selected;
  final DoctorConsultationRequestTileController controller;
  final ValueChanged<ServiceType>? onSelected;
  final VoidCallback? onUnselected;

  void _onPressed(ServiceType type) {
    if (controller.toggleRequestType(type)) {
      onSelected?.call(type);
    } else {
      onUnselected?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ServiceType.values
          .where((s) => s != ServiceType.inPerson)
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
