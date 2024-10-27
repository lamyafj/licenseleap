import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/timeslot_chip_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'add_reservation_new_model.dart';
export 'add_reservation_new_model.dart';

class AddReservationNewWidget extends StatefulWidget {
  const AddReservationNewWidget({super.key});

  @override
  State<AddReservationNewWidget> createState() =>
      _AddReservationNewWidgetState();
}

class _AddReservationNewWidgetState extends State<AddReservationNewWidget> {
  late AddReservationNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddReservationNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().reserveTimeSlot =
            TimeSlotStruct.fromSerializableMap(jsonDecode('{}'));
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF003049),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFF77F00),
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Reserve',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: const Color(0xFFF77F00),
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '\nAvailable Theoritcal Lessons',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF003049),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                StreamBuilder<List<LessonNewRecord>>(
                  stream: queryLessonNewRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<LessonNewRecord> columnLessonNewRecordList =
                        snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnLessonNewRecordList.length,
                          (columnIndex) {
                        final columnLessonNewRecord =
                            columnLessonNewRecordList[columnIndex];
                        return Align(
                          alignment: const AlignmentDirectional(-0.8, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.selectedLesson = columnLessonNewRecord;
                              });
                              setState(() {
                                FFAppState().callenderDateSelected = null;
                                FFAppState().reserveTimeSlot =
                                    TimeSlotStruct.fromSerializableMap(
                                        jsonDecode('{}'));
                              });
                            },
                            child: Text(
                              columnLessonNewRecord.lessonName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: valueOrDefault<Color>(
                                      _model.selectedLesson?.reference ==
                                              columnLessonNewRecord.reference
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context)
                                              .tertiary,
                                      FlutterFlowTheme.of(context).tertiary,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                if (_model.selectedLesson != null)
                  FutureBuilder<List<LessonAvailiblityNewRecord>>(
                    future: queryLessonAvailiblityNewRecordOnce(
                      queryBuilder: (lessonAvailiblityNewRecord) =>
                          lessonAvailiblityNewRecord.where(
                        'lessonRef',
                        isEqualTo: _model.selectedLesson?.reference,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<LessonAvailiblityNewRecord>
                          containerLessonAvailiblityNewRecordList =
                          snapshot.data!;
                      return Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.selectedLesson != null)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Choose Date',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF003049),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        lineHeight: 2.4,
                                      ),
                                ),
                              ),
                            if (_model.selectedLesson == null)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Please choose a lesson',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF003049),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        lineHeight: 2.4,
                                      ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                width: 345.0,
                                height: 400.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(24.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 400.0,
                                  child: custom_widgets.CallanderEvent(
                                    width: 100.0,
                                    height: 400.0,
                                    lessonsAvailableAt:
                                        containerLessonAvailiblityNewRecordList
                                            .map((e) => e.date)
                                            .withoutNulls
                                            .toList(),
                                  ),
                                ),
                              ),
                            ),
                            if (FFAppState().callenderDateSelected == null)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Please Select a Date First',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF003049),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            if (FFAppState().callenderDateSelected != null)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Choose Time\n',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF003049),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            if (FFAppState().callenderDateSelected != null)
                              Container(
                                decoration: const BoxDecoration(),
                                child: StreamBuilder<
                                    List<LessonAvailiblityNewRecord>>(
                                  stream: queryLessonAvailiblityNewRecord(
                                    queryBuilder:
                                        (lessonAvailiblityNewRecord) =>
                                            lessonAvailiblityNewRecord.where(
                                      'date',
                                      isEqualTo:
                                          FFAppState().callenderDateSelected,
                                    ),
                                    limit: 1,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<LessonAvailiblityNewRecord>
                                        chipContainerLessonAvailiblityNewRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            (chipContainerLessonAvailiblityNewRecordList
                                                        .length !=
                                                    null) &&
                                                (chipContainerLessonAvailiblityNewRecordList.isNotEmpty),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (chipContainerLessonAvailiblityNewRecordList
                                                          .first
                                                          .timeSlot[0]
                                                          .availableSeats >
                                                      0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .timeslotChipModel1,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            TimeslotChipWidget(
                                                          remainingSeats:
                                                              chipContainerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[0]
                                                                  .availableSeats,
                                                          isDisabled: false,
                                                          slotValue:
                                                              chipContainerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[0],
                                                        ),
                                                      ),
                                                    ),
                                                  if (chipContainerLessonAvailiblityNewRecordList
                                                          .first
                                                          .timeSlot[1]
                                                          .availableSeats >
                                                      0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .timeslotChipModel2,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            TimeslotChipWidget(
                                                          remainingSeats:
                                                              chipContainerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[1]
                                                                  .availableSeats,
                                                          isDisabled: false,
                                                          slotValue:
                                                              chipContainerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[1],
                                                        ),
                                                      ),
                                                    ),
                                                  if (chipContainerLessonAvailiblityNewRecordList
                                                          .first
                                                          .timeSlot[2]
                                                          .availableSeats >
                                                      0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .timeslotChipModel3,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            TimeslotChipWidget(
                                                          remainingSeats:
                                                              chipContainerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[2]
                                                                  .availableSeats,
                                                          isDisabled: false,
                                                          slotValue:
                                                              chipContainerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[2],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (chipContainerLessonAvailiblityNewRecordList
                                                            .first
                                                            .timeSlot[3]
                                                            .availableSeats >
                                                        0)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .timeslotChipModel4,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              TimeslotChipWidget(
                                                            remainingSeats:
                                                                chipContainerLessonAvailiblityNewRecordList
                                                                    .first
                                                                    .timeSlot[3]
                                                                    .availableSeats,
                                                            isDisabled: false,
                                                            slotValue:
                                                                chipContainerLessonAvailiblityNewRecordList
                                                                    .first
                                                                    .timeSlot[3],
                                                          ),
                                                        ),
                                                      ),
                                                    if (chipContainerLessonAvailiblityNewRecordList
                                                            .first
                                                            .timeSlot[4]
                                                            .availableSeats >
                                                        0)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .timeslotChipModel5,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              TimeslotChipWidget(
                                                            remainingSeats:
                                                                chipContainerLessonAvailiblityNewRecordList
                                                                    .first
                                                                    .timeSlot[4]
                                                                    .availableSeats,
                                                            isDisabled: false,
                                                            slotValue:
                                                                chipContainerLessonAvailiblityNewRecordList
                                                                    .first
                                                                    .timeSlot[4],
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if ((FFAppState().reserveTimeSlot.slotName !=
                                        '') &&
                                (FFAppState().callenderDateSelected != null))
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 40.0, 15.0, 15.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var reservationNewRecordReference =
                                          ReservationNewRecord.collection.doc();
                                      await reservationNewRecordReference
                                          .set(createReservationNewRecordData(
                                        status: 'booked',
                                        reservationTime:
                                            containerLessonAvailiblityNewRecordList
                                                .first.date,
                                        clientId: currentUserReference,
                                        reservationDate:
                                            FFAppState().callenderDateSelected,
                                        timeSlot: FFAppState()
                                            .reserveTimeSlot
                                            .slotName,
                                        lessonRef:
                                            containerLessonAvailiblityNewRecordList
                                                .first.lessonRef,
                                        availabilityRef:
                                            containerLessonAvailiblityNewRecordList
                                                .first.reference,
                                        reservationId:
                                            _model.selectedLesson?.lessonName,
                                      ));
                                      _model.createdReservation =
                                          ReservationNewRecord
                                              .getDocumentFromData(
                                                  createReservationNewRecordData(
                                                    status: 'booked',
                                                    reservationTime:
                                                        containerLessonAvailiblityNewRecordList
                                                            .first.date,
                                                    clientId:
                                                        currentUserReference,
                                                    reservationDate: FFAppState()
                                                        .callenderDateSelected,
                                                    timeSlot: FFAppState()
                                                        .reserveTimeSlot
                                                        .slotName,
                                                    lessonRef:
                                                        containerLessonAvailiblityNewRecordList
                                                            .first.lessonRef,
                                                    availabilityRef:
                                                        containerLessonAvailiblityNewRecordList
                                                            .first.reference,
                                                    reservationId: _model
                                                        .selectedLesson
                                                        ?.lessonName,
                                                  ),
                                                  reservationNewRecordReference);
                                      _model.availToUpdate =
                                          containerLessonAvailiblityNewRecordList
                                              .first;

                                      await containerLessonAvailiblityNewRecordList
                                          .first.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'timeSlot':
                                                getTimeSlotListFirestoreData(
                                              functions.decreaseAvailableSlots(
                                                  _model.availToUpdate!.timeSlot
                                                      .toList(),
                                                  FFAppState().reserveTimeSlot),
                                            ),
                                          },
                                        ),
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Reservation Successful!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      await Future.delayed(
                                          const Duration(milliseconds: 2000));

                                      context.goNamed('viewResevationTheoCopy');

                                      setState(() {});
                                    },
                                    text: 'Reserve',
                                    options: FFButtonOptions(
                                      width: 150.0,
                                      height: 50.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
