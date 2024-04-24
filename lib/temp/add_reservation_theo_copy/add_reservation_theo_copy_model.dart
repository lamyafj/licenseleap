import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_reservation_theo_copy_widget.dart'
    show AddReservationTheoCopyWidget;
import 'package:flutter/material.dart';

class AddReservationTheoCopyModel
    extends FlutterFlowModel<AddReservationTheoCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<LessonRecord>? lessons;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
