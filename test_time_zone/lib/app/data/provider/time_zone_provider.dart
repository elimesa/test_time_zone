import 'package:flutter/material.dart';

import 'package:test_time_zone/app/data/models/details_zone.dart';
import 'package:test_time_zone/app/data/repository/time_zone_repository.dart';

class TimeZoneProvider with ChangeNotifier {
  final TimeZoneRepository _timeZoneRepository = TimeZoneRepository();
  List<DetailsZone> _listDetailsZone = [];
  List<String> _listTimeZone = [];
  bool _isLoading = true;

  List<DetailsZone> get detailsTimeZones => _listDetailsZone;

  List<String> get timeZones => _listTimeZone;

  bool get isLoading => _isLoading;

  TimeZoneProvider() {
    loadInitialData();
    loadAllTimeZones();
  }

  //load initial data when user init app for the first time
  Future<void> loadInitialData() async {
    try {
      DetailsZone initTimeZone = await _timeZoneRepository.getMyZone();
      _listDetailsZone.add(initTimeZone);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadAllTimeZones() async {
    try {
      _listTimeZone = await _timeZoneRepository.getAllZones();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTimeZone(String timeZone) async {
    try {
      //if the timeZone exist then don´t add to the list
      if (_listDetailsZone.any((value) => value.timeZone == timeZone)) return;

      DetailsZone newTimeZone =
          await _timeZoneRepository.getTimeForTimeZone(timeZone);
      _listDetailsZone.add(newTimeZone);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void removeTimeZone(String timeZone) {
    _listDetailsZone.removeWhere((value) => value.timeZone == timeZone);
    notifyListeners();
  }
}
