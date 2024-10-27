// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeSlotStruct extends FFFirebaseStruct {
  TimeSlotStruct({
    String? slotName,
    int? availableSeats,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _slotName = slotName,
        _availableSeats = availableSeats,
        super(firestoreUtilData);

  // "slotName" field.
  String? _slotName;
  String get slotName => _slotName ?? '';
  set slotName(String? val) => _slotName = val;
  bool hasSlotName() => _slotName != null;

  // "availableSeats" field.
  int? _availableSeats;
  int get availableSeats => _availableSeats ?? 30;
  set availableSeats(int? val) => _availableSeats = val;
  void incrementAvailableSeats(int amount) =>
      _availableSeats = availableSeats + amount;
  bool hasAvailableSeats() => _availableSeats != null;

  static TimeSlotStruct fromMap(Map<String, dynamic> data) => TimeSlotStruct(
        slotName: data['slotName'] as String?,
        availableSeats: castToType<int>(data['availableSeats']),
      );

  static TimeSlotStruct? maybeFromMap(dynamic data) =>
      data is Map ? TimeSlotStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'slotName': _slotName,
        'availableSeats': _availableSeats,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slotName': serializeParam(
          _slotName,
          ParamType.String,
        ),
        'availableSeats': serializeParam(
          _availableSeats,
          ParamType.int,
        ),
      }.withoutNulls;

  static TimeSlotStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimeSlotStruct(
        slotName: deserializeParam(
          data['slotName'],
          ParamType.String,
          false,
        ),
        availableSeats: deserializeParam(
          data['availableSeats'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TimeSlotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimeSlotStruct &&
        slotName == other.slotName &&
        availableSeats == other.availableSeats;
  }

  @override
  int get hashCode => const ListEquality().hash([slotName, availableSeats]);
}

TimeSlotStruct createTimeSlotStruct({
  String? slotName,
  int? availableSeats,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimeSlotStruct(
      slotName: slotName,
      availableSeats: availableSeats,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimeSlotStruct? updateTimeSlotStruct(
  TimeSlotStruct? timeSlot, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timeSlot
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimeSlotStructData(
  Map<String, dynamic> firestoreData,
  TimeSlotStruct? timeSlot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timeSlot == null) {
    return;
  }
  if (timeSlot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timeSlot.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timeSlotData = getTimeSlotFirestoreData(timeSlot, forFieldValue);
  final nestedData = timeSlotData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timeSlot.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimeSlotFirestoreData(
  TimeSlotStruct? timeSlot, [
  bool forFieldValue = false,
]) {
  if (timeSlot == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timeSlot.toMap());

  // Add any Firestore field values
  timeSlot.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimeSlotListFirestoreData(
  List<TimeSlotStruct>? timeSlots,
) =>
    timeSlots?.map((e) => getTimeSlotFirestoreData(e, true)).toList() ?? [];
