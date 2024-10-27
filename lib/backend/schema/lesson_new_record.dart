import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LessonNewRecord extends FirestoreRecord {
  LessonNewRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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
    _type = snapshotData['Type'] as String?;
    _classroom = snapshotData['Classroom'] as String?;
    _lessonName = snapshotData['Lesson_name'] as String?;
    _lessonId = snapshotData['Lesson_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lessonNew');

  static Stream<LessonNewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonNewRecord.fromSnapshot(s));

  static Future<LessonNewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonNewRecord.fromSnapshot(s));

  static LessonNewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonNewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonNewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonNewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonNewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonNewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonNewRecordData({
  String? type,
  String? classroom,
  String? lessonName,
  String? lessonId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Type': type,
      'Classroom': classroom,
      'Lesson_name': lessonName,
      'Lesson_id': lessonId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonNewRecordDocumentEquality implements Equality<LessonNewRecord> {
  const LessonNewRecordDocumentEquality();

  @override
  bool equals(LessonNewRecord? e1, LessonNewRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.classroom == e2?.classroom &&
        e1?.lessonName == e2?.lessonName &&
        e1?.lessonId == e2?.lessonId;
  }

  @override
  int hash(LessonNewRecord? e) => const ListEquality()
      .hash([e?.type, e?.classroom, e?.lessonName, e?.lessonId]);

  @override
  bool isValidKey(Object? o) => o is LessonNewRecord;
}
