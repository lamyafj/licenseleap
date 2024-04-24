import '/flutter_flow/flutter_flow_util.dart';
import 'sign_form_widget.dart' show SignFormWidget;
import 'package:flutter/material.dart';

class SignFormModel extends FlutterFlowModel<SignFormWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for name_create widget.
  FocusNode? nameCreateFocusNode;
  TextEditingController? nameCreateTextController;
  String? Function(BuildContext, String?)? nameCreateTextControllerValidator;
  // State field(s) for Nationality widget.
  FocusNode? nationalityFocusNode;
  TextEditingController? nationalityTextController;
  String? Function(BuildContext, String?)? nationalityTextControllerValidator;
  // State field(s) for National_id widget.
  FocusNode? nationalIdFocusNode;
  TextEditingController? nationalIdTextController;
  String? Function(BuildContext, String?)? nationalIdTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameCreateFocusNode?.dispose();
    nameCreateTextController?.dispose();

    nationalityFocusNode?.dispose();
    nationalityTextController?.dispose();

    nationalIdFocusNode?.dispose();
    nationalIdTextController?.dispose();
  }
}
