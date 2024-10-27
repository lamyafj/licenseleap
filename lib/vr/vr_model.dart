import '/flutter_flow/flutter_flow_util.dart';
import 'vr_widget.dart' show VrWidget;
import 'package:flutter/material.dart';

class VrModel extends FlutterFlowModel<VrWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
