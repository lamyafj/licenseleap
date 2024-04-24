import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_slots_available_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_reservation_theo_copy_model.dart';
export 'add_reservation_theo_copy_model.dart';

class AddReservationTheoCopyWidget extends StatefulWidget {
  const AddReservationTheoCopyWidget({
    super.key,
    required this.lessonType,
  });

  final String? lessonType;

  @override
  State<AddReservationTheoCopyWidget> createState() =>
      _AddReservationTheoCopyWidgetState();
}

class _AddReservationTheoCopyWidgetState
    extends State<AddReservationTheoCopyWidget> {
  late AddReservationTheoCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddReservationTheoCopyModel());

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
          actions: [
            Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.lessons = await queryLessonRecordOnce();
                    await actions.runBatchQuery(
                      _model.lessons!.map((e) => e.reference).toList(),
                    );

                    setState(() {});
                  },
                  child: Icon(
                    Icons.batch_prediction,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<LessonRecord>>(
            stream: queryLessonRecord(
              queryBuilder: (lessonRecord) => lessonRecord.where(
                'Type',
                isEqualTo: widget.lessonType,
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
              List<LessonRecord> containerLessonRecordList = snapshot.data!;
              return Container(
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Choose Date',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF003049),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 2.4,
                                  ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 400.0,
                        child: custom_widgets.CallanderEvent(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 400.0,
                          lessonsAvailableAt: containerLessonRecordList
                              .map((e) => e.date)
                              .withoutNulls
                              .toList(),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final lesson = containerLessonRecordList
                              .where((e) =>
                                  e.date == FFAppState().callenderDateSelected)
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: lesson.length,
                            itemBuilder: (context, lessonIndex) {
                              final lessonItem = lesson[lessonIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: Container(
                                      width: double.infinity,
                                      color: const Color(0x00FFFFFF),
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    lessonItem.lessonName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          collapsed: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.0,
                                            height: 0.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          expanded: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 5.0, 20.0,
                                                          10.0),
                                                  child: StreamBuilder<
                                                      List<
                                                          AvailableDatesRecord>>(
                                                    stream:
                                                        queryAvailableDatesRecord(
                                                      parent:
                                                          lessonItem.reference,
                                                      queryBuilder:
                                                          (availableDatesRecord) =>
                                                              availableDatesRecord
                                                                  .where(
                                                        'seatsAvailable',
                                                        isNotEqualTo: 0,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<AvailableDatesRecord>
                                                          wrapAvailableDatesRecordList =
                                                          snapshot.data!;
                                                      if (wrapAvailableDatesRecordList
                                                          .isEmpty) {
                                                        return const NoSlotsAvailableWidget();
                                                      }
                                                      return Wrap(
                                                        spacing: 5.0,
                                                        runSpacing: 5.0,
                                                        alignment: WrapAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: List.generate(
                                                            wrapAvailableDatesRecordList
                                                                .length,
                                                            (wrapIndex) {
                                                          final wrapAvailableDatesRecord =
                                                              wrapAvailableDatesRecordList[
                                                                  wrapIndex];
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('Book Lesson?'),
                                                                            content:
                                                                                const Text('Are you sure you want to book this lesson'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: const Text('Cancel'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: const Text('Confirm'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                if (wrapAvailableDatesRecord
                                                                    .bookedBy
                                                                    .contains(
                                                                        currentUserReference)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'You have already booked this lesson.',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                } else if ((valueOrDefault(
                                                                            currentUserDocument?.lessonsTaken,
                                                                            0) ?? 0) <
                                                                    15) {
                                                                  await ReservationRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createReservationRecordData(
                                                                        clientId:
                                                                            currentUserReference,
                                                                        timeSlot:
                                                                            wrapAvailableDatesRecord.name,
                                                                        reservationDate:
                                                                            lessonItem.date,
                                                                        lessonId:
                                                                            lessonItem.reference,
                                                                        status:
                                                                            'pending',
                                                                        dateRef:
                                                                            wrapAvailableDatesRecord.reference,
                                                                        reservationId:
                                                                            lessonItem.lessonName,
                                                                      ));

                                                                  await wrapAvailableDatesRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'seatsAvailable':
                                                                            FieldValue.increment(-(1)),
                                                                        'bookedBy':
                                                                            FieldValue.arrayUnion([
                                                                          currentUserReference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });

                                                                  await currentUserReference!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'lessonsTaken':
                                                                            FieldValue.increment(1),
                                                                      },
                                                                    ),
                                                                  });
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Your seat has been reserved!',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Your 15 lessons have been completed. You cant book any more lessons.',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              }
                                                            },
                                                            text:
                                                                '${wrapAvailableDatesRecord.name} (${wrapAvailableDatesRecord.seatsAvailable.toString()} left)',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: wrapAvailableDatesRecord
                                                                      .bookedBy
                                                                      .contains(
                                                                          currentUserReference)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          theme: const ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
