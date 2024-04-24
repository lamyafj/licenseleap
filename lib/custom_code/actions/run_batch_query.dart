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

Future runBatchQuery(List<DocumentReference> refrences) async {
  // Add your function code here!
  for (var i = 0; i < refrences.length; i++) {
    for (var j = 0; j < FFAppState().defaultTimeSlot.length; j++) {
      await refrences[i].collection("availableDates").doc().set({
        "index": j,
        "name": FFAppState().defaultTimeSlot[j].slotName,
        "seatsAvailable": FFAppState().defaultTimeSlot[j].availableSeats,
        "bookedBy": [],
      });
    }
  }
}
