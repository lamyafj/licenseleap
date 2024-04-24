import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_resevation_theo_copy_widget.dart'
    show ViewResevationTheoCopyWidget;
import 'package:flutter/material.dart';

class ViewResevationTheoCopyModel
    extends FlutterFlowModel<ViewResevationTheoCopyWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  List<ReservationRecord> reservationsList = [];
  void addToReservationsList(ReservationRecord item) =>
      reservationsList.add(item);
  void removeFromReservationsList(ReservationRecord item) =>
      reservationsList.remove(item);
  void removeAtIndexFromReservationsList(int index) =>
      reservationsList.removeAt(index);
  void insertAtIndexInReservationsList(int index, ReservationRecord item) =>
      reservationsList.insert(index, item);
  void updateReservationsListAtIndex(
          int index, Function(ReservationRecord) updateFn) =>
      reservationsList[index] = updateFn(reservationsList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in viewResevationTheoCopy widget.
  List<ReservationRecord>? reservations;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in ListView widget.
  List<ReservationRecord>? reservationsCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
