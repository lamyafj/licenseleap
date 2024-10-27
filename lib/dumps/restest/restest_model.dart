import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'restest_widget.dart' show RestestWidget;
import 'package:flutter/material.dart';

class RestestModel extends FlutterFlowModel<RestestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Query cache managers for this widget.

  final _mmManager = StreamRequestManager<List<LessonRecord>>();
  Stream<List<LessonRecord>> mm({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<LessonRecord>> Function() requestFn,
  }) =>
      _mmManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMmCache() => _mmManager.clear();
  void clearMmCacheKey(String? uniqueKey) => _mmManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearMmCache();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
