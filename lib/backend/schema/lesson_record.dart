import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonRecord extends FirestoreRecord {
  LessonRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Available_slot" field.
  int? _availableSlot;
  int get availableSlot => _availableSlot ?? 0;
  bool hasAvailableSlot() => _availableSlot != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Classroom" field.
  String? _classroom;
  String get classroom => _classroom ?? '';
  bool hasClassroom() => _classroom != null;

  // "Lesson_name" field.
  String? _lessonName;
  String get lessonName => _lessonName ?? '';
  bool hasLessonName() => _lessonName != null;

  // "Lesson_id" field.
  String? _lessonId;
  String get lessonId => _lessonId ?? '';
  bool hasLessonId() => _lessonId != null;

  void _initializeFields() {
    _date = snapshotData['Date'] as DateTime?;
    _availableSlot = castToType<int>(snapshotData['Available_slot']);
    _type = snapshotData['Type'] as String?;
    _classroom = snapshotData['Classroom'] as String?;
    _lessonName = snapshotData['Lesson_name'] as String?;
    _lessonId = snapshotData['Lesson_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Lesson');

  static Stream<LessonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonRecord.fromSnapshot(s));

  static Future<LessonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonRecord.fromSnapshot(s));

  static LessonRecord fromSnapshot(DocumentSnapshot snapshot) => LessonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonRecordData({
  DateTime? date,
  int? availableSlot,
  String? type,
  String? classroom,
  String? lessonName,
  String? lessonId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Date': date,
      'Available_slot': availableSlot,
      'Type': type,
      'Classroom': classroom,
      'Lesson_name': lessonName,
      'Lesson_id': lessonId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonRecordDocumentEquality implements Equality<LessonRecord> {
  const LessonRecordDocumentEquality();

  @override
  bool equals(LessonRecord? e1, LessonRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.availableSlot == e2?.availableSlot &&
        e1?.type == e2?.type &&
        e1?.classroom == e2?.classroom &&
        e1?.lessonName == e2?.lessonName &&
        e1?.lessonId == e2?.lessonId;
  }

  @override
  int hash(LessonRecord? e) => const ListEquality().hash([
        e?.date,
        e?.availableSlot,
        e?.type,
        e?.classroom,
        e?.lessonName,
        e?.lessonId
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonRecord;
}
