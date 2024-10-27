import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailableDatesRecord extends FirestoreRecord {
  AvailableDatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "seatsAvailable" field.
  int? _seatsAvailable;
  int get seatsAvailable => _seatsAvailable ?? 0;
  bool hasSeatsAvailable() => _seatsAvailable != null;

  // "bookedBy" field.
  List<DocumentReference>? _bookedBy;
  List<DocumentReference> get bookedBy => _bookedBy ?? const [];
  bool hasBookedBy() => _bookedBy != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _seatsAvailable = castToType<int>(snapshotData['seatsAvailable']);
    _bookedBy = getDataList(snapshotData['bookedBy']);
    _name = snapshotData['name'] as String?;
    _index = castToType<int>(snapshotData['index']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('availableDates')
          : FirebaseFirestore.instance.collectionGroup('availableDates');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('availableDates').doc(id);

  static Stream<AvailableDatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvailableDatesRecord.fromSnapshot(s));

  static Future<AvailableDatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvailableDatesRecord.fromSnapshot(s));

  static AvailableDatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvailableDatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvailableDatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvailableDatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvailableDatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvailableDatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvailableDatesRecordData({
  DateTime? date,
  int? seatsAvailable,
  String? name,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'seatsAvailable': seatsAvailable,
      'name': name,
      'index': index,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvailableDatesRecordDocumentEquality
    implements Equality<AvailableDatesRecord> {
  const AvailableDatesRecordDocumentEquality();

  @override
  bool equals(AvailableDatesRecord? e1, AvailableDatesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.seatsAvailable == e2?.seatsAvailable &&
        listEquality.equals(e1?.bookedBy, e2?.bookedBy) &&
        e1?.name == e2?.name &&
        e1?.index == e2?.index;
  }

  @override
  int hash(AvailableDatesRecord? e) => const ListEquality()
      .hash([e?.date, e?.seatsAvailable, e?.bookedBy, e?.name, e?.index]);

  @override
  bool isValidKey(Object? o) => o is AvailableDatesRecord;
}
