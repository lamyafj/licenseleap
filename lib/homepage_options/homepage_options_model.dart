import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'homepage_options_widget.dart' show HomepageOptionsWidget;
import 'package:flutter/material.dart';

class HomepageOptionsModel extends FlutterFlowModel<HomepageOptionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for theprtical_option widget.
  String? theprticalOptionValue;
  FormFieldController<String>? theprticalOptionValueController;
  // State field(s) for simulation_option widget.
  String? simulationOptionValue;
  FormFieldController<String>? simulationOptionValueController;
  // State field(s) for Practical_option widget.
  String? practicalOptionValue;
  FormFieldController<String>? practicalOptionValueController;
  // State field(s) for grades widget.
  String? gradesValue;
  FormFieldController<String>? gradesValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
