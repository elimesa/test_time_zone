import 'package:test_time_zone/models/time_zone.dart';

abstract class TimeZoneRepository {
  Stream<List<TimeZone>> getAllTimeZone();
}