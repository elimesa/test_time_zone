import 'package:test_time_zone/models/zone.dart' as zones;

abstract class ZoneRepository {
  Stream<List<zones.Zone>> getAllZone();
}