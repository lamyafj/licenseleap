// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<LessonAvailiblityNewRecord?> getAvailabilityByDay(
  List<LessonAvailiblityNewRecord>? availDocuments,
  DateTime? selectedDate,
  DocumentReference? selectedLesson,
) async {
  if (availDocuments == null ||
      selectedDate == null ||
      selectedLesson == null) {
    return null;
  }

  for (var document in availDocuments) {
    if (document.date != null &&
        document.date!.year == selectedDate.year &&
        document.date!.month == selectedDate.month &&
        document.date!.day == selectedDate.day &&
        document.lessonRef == selectedLesson) {
      return document;
    }
  }

  return null;
}
