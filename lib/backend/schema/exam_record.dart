import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExamRecord extends FirestoreRecord {
  ExamRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Exam_id" field.
  int? _examId;
  int get examId => _examId ?? 0;
  bool hasExamId() => _examId != null;

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

  void _initializeFields() {
    _examId = castToType<int>(snapshotData['Exam_id']);
    _date = snapshotData['Date'] as DateTime?;
    _availableSlot = castToType<int>(snapshotData['Available_slot']);
    _type = snapshotData['Type'] as String?;
    _classroom = snapshotData['Classroom'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Exam');

  static Stream<ExamRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExamRecord.fromSnapshot(s));

  static Future<ExamRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExamRecord.fromSnapshot(s));

  static ExamRecord fromSnapshot(DocumentSnapshot snapshot) => ExamRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExamRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExamRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExamRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExamRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExamRecordData({
  int? examId,
  DateTime? date,
  int? availableSlot,
  String? type,
  String? classroom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Exam_id': examId,
      'Date': date,
      'Available_slot': availableSlot,
      'Type': type,
      'Classroom': classroom,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExamRecordDocumentEquality implements Equality<ExamRecord> {
  const ExamRecordDocumentEquality();

  @override
  bool equals(ExamRecord? e1, ExamRecord? e2) {
    return e1?.examId == e2?.examId &&
        e1?.date == e2?.date &&
        e1?.availableSlot == e2?.availableSlot &&
        e1?.type == e2?.type &&
        e1?.classroom == e2?.classroom;
  }

  @override
  int hash(ExamRecord? e) => const ListEquality()
      .hash([e?.examId, e?.date, e?.availableSlot, e?.type, e?.classroom]);

  @override
  bool isValidKey(Object? o) => o is ExamRecord;
}
