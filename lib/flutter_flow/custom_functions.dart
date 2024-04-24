import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<TimeSlotStruct>? decreaseAvailableSlots(
  List<TimeSlotStruct> oldSlots,
  TimeSlotStruct selectedSlot,
) {
  /*We create a new list called newSlots to store the updated timeslots.

  We loop through each listItem in the oldSlots list.

  For each listItem, we check if its slotName matches the slotName of the selectedSlot.

  If there is a match, we create a new TimeSlotStruct object with the same slotName as listItem and decrement the availableSeats by 1. We add this new object to the newSlots list.

  If there is no match, we simply add the listItem as it is to the newSlots list.

  After iterating through all the timeslots, we return the newSlots list, which contains the updated timeslots with the decremented available seats for the selected slot.*/

  List<TimeSlotStruct> newSlots = [];

  for (var listItem in oldSlots) {
    if (listItem.slotName == selectedSlot.slotName) {
      newSlots.add(TimeSlotStruct(
        slotName: listItem.slotName,
        availableSeats: listItem.availableSeats - 1,
      ));
    } else {
      newSlots.add(listItem);
    }
  }

  print(newSlots);

  return newSlots;
}

List<TimeSlotStruct>? increaseAvailableSlots(
  List<TimeSlotStruct> oldSlots,
  String selectedSlot,
) {
  /*We create a new list called newSlots to store the updated timeslots.

  We loop through each listItem in the oldSlots list.

  For each listItem, we check if its slotName matches the slotName of the selectedSlot.

  If there is a match, we create a new TimeSlotStruct object with the same slotName as listItem and decrement the availableSeats by 1. We add this new object to the newSlots list.

  If there is no match, we simply add the listItem as it is to the newSlots list.

  After iterating through all the timeslots, we return the newSlots list, which contains the updated timeslots with the decremented available seats for the selected slot.*/

  List<TimeSlotStruct> newSlots = [];

  for (var listItem in oldSlots) {
    if (listItem.slotName == selectedSlot) {
      newSlots.add(TimeSlotStruct(
        slotName: listItem.slotName,
        availableSeats: listItem.availableSeats + 1,
      ));
    } else {
      newSlots.add(listItem);
    }
  }

  print(newSlots);

  return newSlots;
}

List<DateTime> convertSingleItemToList(DateTime date) {
  return [date];
}

List<ReservationRecord> filterReservationDocs(
  List<ReservationRecord> reservations,
  String? searchedText,
) {
  if (searchedText == null || searchedText.isEmpty) {
    return reservations;
  }
  return reservations
      .where((e) => e.reservationId.contains(searchedText))
      .toList();
}
