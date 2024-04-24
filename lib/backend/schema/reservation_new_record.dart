import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ReservationNewRecord extends FirestoreRecord {
  ReservationNewRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Reservation_time" field.
  DateTime? _reservationTime;
  DateTime? get reservationTime => _reservationTime;
  bool hasReservationTime() => _reservationTime != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "Client_id" field.
  DocumentReference? _clientId;
  DocumentReference? get clientId => _clientId;
  bool hasClientId() => _clientId != null;

  // "Reservation_id" field.
  String? _reservationId;
  String get reservationId => _reservationId ?? '';
  bool hasReservationId() => _reservationId != null;

  // "reservationDate" field.
  DateTime? _reservationDate;
  DateTime? get reservationDate => _reservationDate;
  bool hasReservationDate() => _reservationDate != null;

  // "timeSlot" field.
  String? _timeSlot;
  String get timeSlot => _timeSlot ?? '';
  bool hasTimeSlot() => _timeSlot != null;

  // "lessonRef" field.
  DocumentReference? _lessonRef;
  DocumentReference? get lessonRef => _lessonRef;
  bool hasLessonRef() => _lessonRef != null;

  // "availabilityRef" field.
  DocumentReference? _availabilityRef;
  DocumentReference? get availabilityRef => _availabilityRef;
  bool hasAvailabilityRef() => _availabilityRef != null;

  void _initializeFields() {
    _reservationTime = snapshotData['Reservation_time'] as DateTime?;
    _status = snapshotData['Status'] as String?;
    _clientId = snapshotData['Client_id'] as DocumentReference?;
    _reservationId = snapshotData['Reservation_id'] as String?;
    _reservationDate = snapshotData['reservationDate'] as DateTime?;
    _timeSlot = snapshotData['timeSlot'] as String?;
    _lessonRef = snapshotData['lessonRef'] as DocumentReference?;
    _availabilityRef = snapshotData['availabilityRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservationNew');

  static Stream<ReservationNewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationNewRecord.fromSnapshot(s));

  static Future<ReservationNewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationNewRecord.fromSnapshot(s));

  static ReservationNewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationNewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationNewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationNewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationNewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationNewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationNewRecordData({
  DateTime? reservationTime,
  String? status,
  DocumentReference? clientId,
  String? reservationId,
  DateTime? reservationDate,
  String? timeSlot,
  DocumentReference? lessonRef,
  DocumentReference? availabilityRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Reservation_time': reservationTime,
      'Status': status,
      'Client_id': clientId,
      'Reservation_id': reservationId,
      'reservationDate': reservationDate,
      'timeSlot': timeSlot,
      'lessonRef': lessonRef,
      'availabilityRef': availabilityRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationNewRecordDocumentEquality
    implements Equality<ReservationNewRecord> {
  const ReservationNewRecordDocumentEquality();

  @override
  bool equals(ReservationNewRecord? e1, ReservationNewRecord? e2) {
    return e1?.reservationTime == e2?.reservationTime &&
        e1?.status == e2?.status &&
        e1?.clientId == e2?.clientId &&
        e1?.reservationId == e2?.reservationId &&
        e1?.reservationDate == e2?.reservationDate &&
        e1?.timeSlot == e2?.timeSlot &&
        e1?.lessonRef == e2?.lessonRef &&
        e1?.availabilityRef == e2?.availabilityRef;
  }

  @override
  int hash(ReservationNewRecord? e) => const ListEquality().hash([
        e?.reservationTime,
        e?.status,
        e?.clientId,
        e?.reservationId,
        e?.reservationDate,
        e?.timeSlot,
        e?.lessonRef,
        e?.availabilityRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservationNewRecord;
}
