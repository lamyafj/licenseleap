import '/backend/backend.dart';
import '/components/timeslot_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_reservation_new_widget.dart' show AddReservationNewWidget;
import 'package:flutter/material.dart';

class AddReservationNewModel extends FlutterFlowModel<AddReservationNewWidget> {
  ///  Local state fields for this page.

  LessonNewRecord? selectedLesson;

  LessonAvailiblityNewRecord? availToUpdate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for timeslotChip component.
  late TimeslotChipModel timeslotChipModel1;
  // Model for timeslotChip component.
  late TimeslotChipModel timeslotChipModel2;
  // Model for timeslotChip component.
  late TimeslotChipModel timeslotChipModel3;
  // Model for timeslotChip component.
  late TimeslotChipModel timeslotChipModel4;
  // Model for timeslotChip component.
  late TimeslotChipModel timeslotChipModel5;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReservationNewRecord? createdReservation;

  @override
  void initState(BuildContext context) {
    timeslotChipModel1 = createModel(context, () => TimeslotChipModel());
    timeslotChipModel2 = createModel(context, () => TimeslotChipModel());
    timeslotChipModel3 = createModel(context, () => TimeslotChipModel());
    timeslotChipModel4 = createModel(context, () => TimeslotChipModel());
    timeslotChipModel5 = createModel(context, () => TimeslotChipModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    timeslotChipModel1.dispose();
    timeslotChipModel2.dispose();
    timeslotChipModel3.dispose();
    timeslotChipModel4.dispose();
    timeslotChipModel5.dispose();
  }
}
