import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _defaultTimeSlot = prefs
              .getStringList('ff_defaultTimeSlot')
              ?.map((x) {
                try {
                  return TimeSlotStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _defaultTimeSlot;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _selectdate;
  DateTime? get selectdate => _selectdate;
  set selectdate(DateTime? value) {
    _selectdate = value;
  }

  List<TimeSlotStruct> _defaultTimeSlot = [
    TimeSlotStruct.fromSerializableMap(
        jsonDecode('{\"slotName\":\"7-8\",\"availableSeats\":\"30\"}')),
    TimeSlotStruct.fromSerializableMap(
        jsonDecode('{\"slotName\":\"8-9\",\"availableSeats\":\"30\"}')),
    TimeSlotStruct.fromSerializableMap(
        jsonDecode('{\"slotName\":\"9-10\",\"availableSeats\":\"30\"}')),
    TimeSlotStruct.fromSerializableMap(
        jsonDecode('{\"slotName\":\"10-11\",\"availableSeats\":\"30\"}')),
    TimeSlotStruct.fromSerializableMap(
        jsonDecode('{\"slotName\":\"11-12\",\"availableSeats\":\"30\"}')),
    TimeSlotStruct.fromSerializableMap(
        jsonDecode('{\"slotName\":\"12-1\",\"availableSeats\":\"30\"}'))
  ];
  List<TimeSlotStruct> get defaultTimeSlot => _defaultTimeSlot;
  set defaultTimeSlot(List<TimeSlotStruct> value) {
    _defaultTimeSlot = value;
    prefs.setStringList(
        'ff_defaultTimeSlot', value.map((x) => x.serialize()).toList());
  }

  void addToDefaultTimeSlot(TimeSlotStruct value) {
    _defaultTimeSlot.add(value);
    prefs.setStringList('ff_defaultTimeSlot',
        _defaultTimeSlot.map((x) => x.serialize()).toList());
  }

  void removeFromDefaultTimeSlot(TimeSlotStruct value) {
    _defaultTimeSlot.remove(value);
    prefs.setStringList('ff_defaultTimeSlot',
        _defaultTimeSlot.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDefaultTimeSlot(int index) {
    _defaultTimeSlot.removeAt(index);
    prefs.setStringList('ff_defaultTimeSlot',
        _defaultTimeSlot.map((x) => x.serialize()).toList());
  }

  void updateDefaultTimeSlotAtIndex(
    int index,
    TimeSlotStruct Function(TimeSlotStruct) updateFn,
  ) {
    _defaultTimeSlot[index] = updateFn(_defaultTimeSlot[index]);
    prefs.setStringList('ff_defaultTimeSlot',
        _defaultTimeSlot.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDefaultTimeSlot(int index, TimeSlotStruct value) {
    _defaultTimeSlot.insert(index, value);
    prefs.setStringList('ff_defaultTimeSlot',
        _defaultTimeSlot.map((x) => x.serialize()).toList());
  }

  DateTime? _callenderDateSelected;
  DateTime? get callenderDateSelected => _callenderDateSelected;
  set callenderDateSelected(DateTime? value) {
    _callenderDateSelected = value;
  }

  TimeSlotStruct _reserveTimeSlot =
      TimeSlotStruct.fromSerializableMap(jsonDecode('{}'));
  TimeSlotStruct get reserveTimeSlot => _reserveTimeSlot;
  set reserveTimeSlot(TimeSlotStruct value) {
    _reserveTimeSlot = value;
  }

  void updateReserveTimeSlotStruct(Function(TimeSlotStruct) updateFn) {
    updateFn(_reserveTimeSlot);
  }

  final _ggManager = StreamRequestManager<List<ClientRecord>>();
  Stream<List<ClientRecord>> gg({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ClientRecord>> Function() requestFn,
  }) =>
      _ggManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGgCache() => _ggManager.clear();
  void clearGgCacheKey(String? uniqueKey) => _ggManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
