import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LessonAvailiblityNewRecord extends FirestoreRecord {
  LessonAvailiblityNewRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "lessonRef" field.
  DocumentReference? _lessonRef;
  DocumentReference? get lessonRef => _lessonRef;
  bool hasLessonRef() => _lessonRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "timeSlot" field.
  List<TimeSlotStruct>? _timeSlot;
  List<TimeSlotStruct> get timeSlot => _timeSlot ?? const [];
  bool hasTimeSlot() => _timeSlot != null;

  void _initializeFields() {
    _lessonRef = snapshotData['lessonRef'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _timeSlot = getStructList(
      snapshotData['timeSlot'],
      TimeSlotStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lessonAvailiblityNew');

  static Stream<LessonAvailiblityNewRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => LessonAvailiblityNewRecord.fromSnapshot(s));

  static Future<LessonAvailiblityNewRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LessonAvailiblityNewRecord.fromSnapshot(s));

  static LessonAvailiblityNewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonAvailiblityNewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonAvailiblityNewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonAvailiblityNewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonAvailiblityNewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonAvailiblityNewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonAvailiblityNewRecordData({
  DocumentReference? lessonRef,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lessonRef': lessonRef,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonAvailiblityNewRecordDocumentEquality
    implements Equality<LessonAvailiblityNewRecord> {
  const LessonAvailiblityNewRecordDocumentEquality();

  @override
  bool equals(LessonAvailiblityNewRecord? e1, LessonAvailiblityNewRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lessonRef == e2?.lessonRef &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.timeSlot, e2?.timeSlot);
  }

  @override
  int hash(LessonAvailiblityNewRecord? e) =>
      const ListEquality().hash([e?.lessonRef, e?.date, e?.timeSlot]);

  @override
  bool isValidKey(Object? o) => o is LessonAvailiblityNewRecord;
}
