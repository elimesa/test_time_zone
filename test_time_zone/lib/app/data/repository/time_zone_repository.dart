import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:test_time_zone/app/data/models/details_zone.dart';

class TimeZoneRepository {
  static const String baseUrl = 'http://worldtimeapi.org/api';

  Future<DetailsZone> getMyZone() async {
    final response = await http.get(Uri.parse('$baseUrl/ip'));
    if (response.statusCode == 200) {
      return DetailsZone.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load zone');
    }
  }

  Future<List<String>> getAllZones() async {
    final response = await http.get(Uri.parse('$baseUrl/timezone'));
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load time zones');
    }
  }

  Future<DetailsZone> getTimeForTimeZone(String timeZone) async {
    final response = await http.get(Uri.parse('$baseUrl/$timeZone'));
    if (response.statusCode == 200) {
      return DetailsZone.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load time for timezone');
    }
  }
}
