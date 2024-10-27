import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'homepage_options_model.dart';
export 'homepage_options_model.dart';

class HomepageOptionsWidget extends StatefulWidget {
  const HomepageOptionsWidget({super.key});

  @override
  State<HomepageOptionsWidget> createState() => _HomepageOptionsWidgetState();
}

class _HomepageOptionsWidgetState extends State<HomepageOptionsWidget> {
  late HomepageOptionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<ClientRecord>>(
        stream: FFAppState().gg(
          uniqueQueryKey:
              valueOrDefault(currentUserDocument?.creditHours, 0).toString(),
          requestFn: () => queryClientRecord(
            singleRecord: true,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }
          List<ClientRecord> homepageOptionsClientRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final homepageOptionsClientRecord =
              homepageOptionsClientRecordList.isNotEmpty
                  ? homepageOptionsClientRecordList.first
                  : null;
          return GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor: const Color(0xFF003049),
                automaticallyImplyLeading: false,
                leading: Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Text(
                    valueOrDefault(currentUserDocument?.creditHours, 0)
                        .toString(),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: const Color(0xFFF77F00),
                          fontSize: 40.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                actions: [
                  Align(
                    alignment: const AlignmentDirectional(0.4, -0.41),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Profilepage');
                      },
                      child: const Icon(
                        Icons.person,
                        color: Color(0xFFF77F00),
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
                centerTitle: true,
                elevation: 2.0,
              ),
              body: Stack(
                alignment: const AlignmentDirectional(0.0, -1.0),
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-0.04, -0.83),
                            child: Text(
                              'My Study Plan',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFF77F00),
                                    fontSize: 35.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Opacity(
                            opacity: valueOrDefault(
                                        currentUserDocument?.progress, '') !=
                                    'Theortical'
                                ? 0.5
                                : 1.0,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -0.52),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.theprticalOptionValueController ??=
                                          FormFieldController<String>(null),
                                  options: const [
                                    'Reserve Lessons',
                                    'Reserve Exam',
                                    'View Reservations'
                                  ],
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.theprticalOptionValue = val);
                                    if (_model.theprticalOptionValue ==
                                        'Reserve Lessons') {
                                      context.pushNamed(
                                        'AddReservationTheoCopy',
                                        queryParameters: {
                                          'lessonType': serializeParam(
                                            'Theoritical',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else if (_model.theprticalOptionValue ==
                                        'View Reservations') {
                                      context
                                          .pushNamed('viewResevationTheoCopy');
                                    } else if (_model.theprticalOptionValue ==
                                        'Reserve Exam') {
                                      context.pushNamed(
                                        'AddReservationTheoCopy',
                                        queryParameters: {
                                          'lessonType': serializeParam(
                                            'Theoritical',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  width: valueOrDefault(
                                              currentUserDocument?.progress,
                                              '') !=
                                          'Theortical'
                                      ? 300.0
                                      : 400.0,
                                  height: valueOrDefault(
                                              currentUserDocument?.progress,
                                              '') !=
                                          'Theortical'
                                      ? 30.0
                                      : 56.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFFF77F00),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  hintText: 'Theoritical',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 15.0,
                                  ),
                                  fillColor: () {
                                    if (valueOrDefault(
                                            currentUserDocument?.progress,
                                            '') ==
                                        'Theortical') {
                                      return const Color(0xFFFFF9AE);
                                    } else if ((valueOrDefault(
                                                currentUserDocument?.progress,
                                                '') ==
                                            'Simulation') ||
                                        (valueOrDefault(
                                                currentUserDocument?.progress,
                                                '') ==
                                            'Practical')) {
                                      return const Color(0xFFDBFFBA);
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .alternate;
                                    }
                                  }(),
                                  elevation: 0.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ),
                          ),
                          if (valueOrDefault(
                                  currentUserDocument?.creditHours, 0) !=
                              6)
                            Opacity(
                              opacity: valueOrDefault(
                                          currentUserDocument?.progress, '') !=
                                      'Simulation'
                                  ? 0.5
                                  : 1.0,
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, -0.29),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 12.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .simulationOptionValueController ??=
                                        FormFieldController<String>(null),
                                    options: const ['Reserve Simulations', 'VR'],
                                    onChanged: (val) async {
                                      setState(() =>
                                          _model.simulationOptionValue = val);
                                      if (_model.simulationOptionValue ==
                                          'Reserve Simulations') {
                                        context.pushNamed(
                                          'AddReservationTheoCopy',
                                          queryParameters: {
                                            'lessonType': serializeParam(
                                              'Simulation',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    width: valueOrDefault(
                                                currentUserDocument?.progress,
                                                '') !=
                                            'Simulation'
                                        ? 300.0
                                        : 400.0,
                                    height: valueOrDefault(
                                                currentUserDocument?.progress,
                                                '') !=
                                            'Simulation'
                                        ? 30.0
                                        : 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFF77F00),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    hintText: 'Simulations',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 15.0,
                                    ),
                                    fillColor: () {
                                      if (valueOrDefault(
                                              currentUserDocument?.progress,
                                              '') ==
                                          'Simulation') {
                                        return const Color(0xFFFFF9AE);
                                      } else if (valueOrDefault(
                                              currentUserDocument?.progress,
                                              '') ==
                                          'Practical') {
                                        return const Color(0xFFDBFFBA);
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .alternate;
                                      }
                                    }(),
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                            ),
                          Opacity(
                            opacity: valueOrDefault(
                                        currentUserDocument?.progress, '') !=
                                    'Practical'
                                ? 0.5
                                : 1.0,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -0.06),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.practicalOptionValueController ??=
                                          FormFieldController<String>(null),
                                  options: const [
                                    'Reserve Lessons',
                                    'Reserve Exam',
                                    'View Reservations'
                                  ],
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.practicalOptionValue = val);
                                    if ((_model.practicalOptionValue ==
                                            'Reserve Lessons') ||
                                        (_model.practicalOptionValue ==
                                            'Reserve exam')) {
                                      context.pushNamed(
                                        'AddReservationTheoCopy',
                                        queryParameters: {
                                          'lessonType': serializeParam(
                                            'Practical',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else if (_model.practicalOptionValue ==
                                        'View Reservations') {
                                      context
                                          .pushNamed('viewResevationTheoCopy');
                                    }
                                  },
                                  width: valueOrDefault(
                                              currentUserDocument?.progress,
                                              '') !=
                                          'Practical'
                                      ? 300.0
                                      : 400.0,
                                  height: valueOrDefault(
                                              currentUserDocument?.progress,
                                              '') !=
                                          'Practical'
                                      ? 30.0
                                      : 56.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFFF77F00),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  hintText: 'Practical',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 15.0,
                                  ),
                                  fillColor: () {
                                    if (valueOrDefault(
                                            currentUserDocument?.progress,
                                            '') ==
                                        'Practical') {
                                      return const Color(0xFFFFF9AE);
                                    } else if (valueOrDefault(
                                            currentUserDocument?.progress,
                                            '') ==
                                        'done') {
                                      return const Color(0xFFDBFFBA);
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .alternate;
                                    }
                                  }(),
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 1.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.16),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 12.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.gradesValueController ??=
                                    FormFieldController<String>(null),
                                options: const ['view grades'],
                                onChanged: (val) async {
                                  setState(() => _model.gradesValue = val);
                                  if (_model.gradesValue == 'view grades') {
                                    context.pushNamed('addReservationPage');
                                  }
                                },
                                height: 56.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF003049),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                hintText: 'Grades',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                                fillColor: const Color(0xFFBDFFFB),
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                          if (valueOrDefault(
                                  currentUserDocument?.paymentStatus, '') ==
                              'unpaid')
                            Align(
                              alignment: const AlignmentDirectional(-0.04, 0.84),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 15.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('PaymentPage');
                                  },
                                  text: 'Pay',
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF003049),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFF77F00),
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createClientRecordData(
                                      creditHours: 15,
                                    ));
                                  },
                                  text: '15',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createClientRecordData(
                                      creditHours: 6,
                                    ));
                                  },
                                  text: '6',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createClientRecordData(
                                      creditHours: 30,
                                    ));
                                  },
                                  text: '30',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createClientRecordData(
                                      creditHours: 0,
                                    ));
                                  },
                                  text: '0',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createClientRecordData(
                                      progress: 'Theortical',
                                    ));
                                  },
                                  text: 'Theortical',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createClientRecordData(
                                      progress: 'Practical',
                                    ));
                                  },
                                  text: 'Practical',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createClientRecordData(
                                      progress: 'Simulation',
                                    ));
                                  },
                                  text: 'simulation',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(const SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
