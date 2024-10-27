import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'timeslot_chip_model.dart';
export 'timeslot_chip_model.dart';

class TimeslotChipWidget extends StatefulWidget {
  const TimeslotChipWidget({
    super.key,
    int? remainingSeats,
    required this.slotValue,
    bool? isDisabled,
  })  : remainingSeats = remainingSeats ?? 0,
        isDisabled = isDisabled ?? true;

  final int remainingSeats;
  final TimeSlotStruct? slotValue;
  final bool isDisabled;

  @override
  State<TimeslotChipWidget> createState() => _TimeslotChipWidgetState();
}

class _TimeslotChipWidgetState extends State<TimeslotChipWidget> {
  late TimeslotChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeslotChipModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.updatePage(() {
          FFAppState().reserveTimeSlot = widget.slotValue!;
        });
      },
      child: Container(
        width: 100.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: widget.slotValue?.slotName ==
                  FFAppState().reserveTimeSlot.slotName
              ? FlutterFlowTheme.of(context).secondary
              : FlutterFlowTheme.of(context).tertiary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          valueOrDefault<String>(
            widget.slotValue?.slotName,
            'name',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).info,
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
