import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_reservation_theo_copy_widget.dart'
    show EditReservationTheoCopyWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class EditReservationTheoCopyModel
    extends FlutterFlowModel<EditReservationTheoCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<LessonRecord>? lessons;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableExpandableController.dispose();
  }
}
