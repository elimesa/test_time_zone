import 'dart:convert';

import 'package:equatable/equatable.dart';

class TimeZone extends Equatable {
  final List<String>? timeZone;

  const TimeZone({this.timeZone});

  @override
  List<Object?> get props => [timeZone];

  factory TimeZone.fromJson(List<dynamic> json) {
    return TimeZone(
      timeZone: List<String>.from(json.map((value) => value as String)),
    );
  }
}

TimeZone timeZoneFromJson(String str) => TimeZone.fromJson(jsonDecode(str));
