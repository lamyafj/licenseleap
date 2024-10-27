import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultRecord extends FirestoreRecord {
  ResultRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Result" field.
  String? _result;
  String get result => _result ?? '';
  bool hasResult() => _result != null;

  // "Score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "Client_id" field.
  DocumentReference? _clientId;
  DocumentReference? get clientId => _clientId;
  bool hasClientId() => _clientId != null;

  // "Exam_id" field.
  DocumentReference? _examId;
  DocumentReference? get examId => _examId;
  bool hasExamId() => _examId != null;

  void _initializeFields() {
    _result = snapshotData['Result'] as String?;
    _score = castToType<int>(snapshotData['Score']);
    _clientId = snapshotData['Client_id'] as DocumentReference?;
    _examId = snapshotData['Exam_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Result');

  static Stream<ResultRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResultRecord.fromSnapshot(s));

  static Future<ResultRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResultRecord.fromSnapshot(s));

  static ResultRecord fromSnapshot(DocumentSnapshot snapshot) => ResultRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResultRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResultRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResultRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResultRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResultRecordData({
  String? result,
  int? score,
  DocumentReference? clientId,
  DocumentReference? examId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Result': result,
      'Score': score,
      'Client_id': clientId,
      'Exam_id': examId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResultRecordDocumentEquality implements Equality<ResultRecord> {
  const ResultRecordDocumentEquality();

  @override
  bool equals(ResultRecord? e1, ResultRecord? e2) {
    return e1?.result == e2?.result &&
        e1?.score == e2?.score &&
        e1?.clientId == e2?.clientId &&
        e1?.examId == e2?.examId;
  }

  @override
  int hash(ResultRecord? e) =>
      const ListEquality().hash([e?.result, e?.score, e?.clientId, e?.examId]);

  @override
  bool isValidKey(Object? o) => o is ResultRecord;
}
