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
import 'edit_reservation_new_model.dart';
export 'edit_reservation_new_model.dart';

class EditReservationNewWidget extends StatefulWidget {
  const EditReservationNewWidget({
    super.key,
    required this.reservationDoc,
    required this.selectedLessonDoc,
    required this.oldAvailDocRef,
  });

  final ReservationNewRecord? reservationDoc;
  final LessonNewRecord? selectedLessonDoc;
  final DocumentReference? oldAvailDocRef;

  @override
  State<EditReservationNewWidget> createState() =>
      _EditReservationNewWidgetState();
}

class _EditReservationNewWidgetState extends State<EditReservationNewWidget> {
  late EditReservationNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditReservationNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.selectedLesson = widget.selectedLessonDoc;
      });
      setState(() {
        FFAppState().callenderDateSelected = null;
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
            'Edit Reservation',
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
                    '\nSelected Theoritcal Lesson',
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.selectedLessonDoc?.lessonName,
                          'name',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: const Color(0xFFF77F00),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
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
                                        containerLessonAvailiblityNewRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            containerLessonAvailiblityNewRecordList.isNotEmpty,
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
                                                  if (containerLessonAvailiblityNewRecordList
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
                                                              containerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[0]
                                                                  .availableSeats,
                                                          isDisabled: false,
                                                          slotValue:
                                                              containerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[0],
                                                        ),
                                                      ),
                                                    ),
                                                  if (containerLessonAvailiblityNewRecordList
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
                                                              containerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[1]
                                                                  .availableSeats,
                                                          isDisabled: false,
                                                          slotValue:
                                                              containerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[1],
                                                        ),
                                                      ),
                                                    ),
                                                  if (containerLessonAvailiblityNewRecordList
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
                                                              containerLessonAvailiblityNewRecordList
                                                                  .first
                                                                  .timeSlot[2]
                                                                  .availableSeats,
                                                          isDisabled: false,
                                                          slotValue:
                                                              containerLessonAvailiblityNewRecordList
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
                                                    if (containerLessonAvailiblityNewRecordList
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
                                                                containerLessonAvailiblityNewRecordList
                                                                    .first
                                                                    .timeSlot[3]
                                                                    .availableSeats,
                                                            isDisabled: false,
                                                            slotValue:
                                                                containerLessonAvailiblityNewRecordList
                                                                    .first
                                                                    .timeSlot[3],
                                                          ),
                                                        ),
                                                      ),
                                                    if (containerLessonAvailiblityNewRecordList
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
                                                                containerLessonAvailiblityNewRecordList
                                                                    .first
                                                                    .timeSlot[4]
                                                                    .availableSeats,
                                                            isDisabled: false,
                                                            slotValue:
                                                                containerLessonAvailiblityNewRecordList
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
                                      await widget.reservationDoc!.reference
                                          .update(
                                              createReservationNewRecordData(
                                        reservationDate:
                                            FFAppState().callenderDateSelected,
                                        reservationTime:
                                            FFAppState().callenderDateSelected,
                                        status: 'booked',
                                        timeSlot: FFAppState()
                                            .reserveTimeSlot
                                            .slotName,
                                      ));
                                      _model.availToUpdate =
                                          containerLessonAvailiblityNewRecordList
                                              .first;
                                      _model.oldAvailDoc =
                                          await LessonAvailiblityNewRecord
                                              .getDocumentOnce(
                                                  widget.oldAvailDocRef!);

                                      await containerLessonAvailiblityNewRecordList
                                          .first.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'timeSlot':
                                                getTimeSlotListFirestoreData(
                                              functions.increaseAvailableSlots(
                                                  _model.oldAvailDoc!.timeSlot
                                                      .toList(),
                                                  widget.reservationDoc!
                                                      .timeSlot),
                                            ),
                                          },
                                        ),
                                      });

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
                                            'Reservation has been updated!',
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
