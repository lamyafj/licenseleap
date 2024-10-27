import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientRecord extends FirestoreRecord {
  ClientRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Client_id" field.
  int? _clientId;
  int get clientId => _clientId ?? 0;
  bool hasClientId() => _clientId != null;

  // "National_id" field.
  int? _nationalId;
  int get nationalId => _nationalId ?? 0;
  bool hasNationalId() => _nationalId != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  bool hasNationality() => _nationality != null;

  // "DOB" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "Credit_hours" field.
  int? _creditHours;
  int get creditHours => _creditHours ?? 0;
  bool hasCreditHours() => _creditHours != null;

  // "Payment_status" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "Progress" field.
  String? _progress;
  String get progress => _progress ?? '';
  bool hasProgress() => _progress != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "lessonsTaken" field.
  int? _lessonsTaken;
  int get lessonsTaken => _lessonsTaken ?? 0;
  bool hasLessonsTaken() => _lessonsTaken != null;

  void _initializeFields() {
    _clientId = castToType<int>(snapshotData['Client_id']);
    _nationalId = castToType<int>(snapshotData['National_id']);
    _name = snapshotData['Name'] as String?;
    _nationality = snapshotData['Nationality'] as String?;
    _dob = snapshotData['DOB'] as DateTime?;
    _password = snapshotData['Password'] as String?;
    _creditHours = castToType<int>(snapshotData['Credit_hours']);
    _paymentStatus = snapshotData['Payment_status'] as String?;
    _progress = snapshotData['Progress'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lessonsTaken = castToType<int>(snapshotData['lessonsTaken']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Client');

  static Stream<ClientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientRecord.fromSnapshot(s));

  static Future<ClientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientRecord.fromSnapshot(s));

  static ClientRecord fromSnapshot(DocumentSnapshot snapshot) => ClientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientRecordData({
  int? clientId,
  int? nationalId,
  String? name,
  String? nationality,
  DateTime? dob,
  String? password,
  int? creditHours,
  String? paymentStatus,
  String? progress,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? email,
  String? phoneNumber,
  int? lessonsTaken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Client_id': clientId,
      'National_id': nationalId,
      'Name': name,
      'Nationality': nationality,
      'DOB': dob,
      'Password': password,
      'Credit_hours': creditHours,
      'Payment_status': paymentStatus,
      'Progress': progress,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'email': email,
      'phone_number': phoneNumber,
      'lessonsTaken': lessonsTaken,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientRecordDocumentEquality implements Equality<ClientRecord> {
  const ClientRecordDocumentEquality();

  @override
  bool equals(ClientRecord? e1, ClientRecord? e2) {
    return e1?.clientId == e2?.clientId &&
        e1?.nationalId == e2?.nationalId &&
        e1?.name == e2?.name &&
        e1?.nationality == e2?.nationality &&
        e1?.dob == e2?.dob &&
        e1?.password == e2?.password &&
        e1?.creditHours == e2?.creditHours &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.progress == e2?.progress &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lessonsTaken == e2?.lessonsTaken;
  }

  @override
  int hash(ClientRecord? e) => const ListEquality().hash([
        e?.clientId,
        e?.nationalId,
        e?.name,
        e?.nationality,
        e?.dob,
        e?.password,
        e?.creditHours,
        e?.paymentStatus,
        e?.progress,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.email,
        e?.phoneNumber,
        e?.lessonsTaken
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientRecord;
}
