import 'package:equatable/equatable.dart';

class DetailsZone extends Equatable {
  final String? utcOffset;
  final String? timeZone;
  final int? dayOfWeek;
  final int? dayOfYear;
  final String? dateTime;
  final String? utcDateTime;
  final int? unixTime;
  final int? rawOffSet;
  final int? weekNumber;
  final bool? dst;
  final String? abbreviation;
  final int? dstOffset;
  final String? dstFrom;
  final String? stUntil;
  final String? clientIp;

  const DetailsZone(
      {this.utcOffset,
      required this.timeZone,
      required this.dayOfWeek,
      required this.dayOfYear,
      required this.dateTime,
      required this.utcDateTime,
      required this.unixTime,
      this.rawOffSet,
      required this.weekNumber,
      this.dst,
      required this.abbreviation,
      this.dstOffset,
      this.dstFrom,
      this.stUntil,
      this.clientIp});

  factory DetailsZone.fromJson(Map<String, dynamic> json) {
    return DetailsZone(
      dayOfWeek: json['day_of_week'] ?? 0,
      dayOfYear: json['day_of_year'] ?? 0,
      utcOffset: json['utc_offset'] ?? '',
      utcDateTime: json['utc_datetime'] ?? '',
      unixTime: json['unixtime'] ?? 0,
      rawOffSet: json['raw_offset'] ?? 0,
      weekNumber: json['week_number'] ?? 0,
      dst: json['dst'] ?? false,
      abbreviation: json['abbreviation'] ?? '',
      dstOffset: json['dst_offset'] ?? 0,
      dstFrom: json['dst_from'] ?? '',
      stUntil: json['dst_until'] ?? '',
      clientIp: json['client_ip'] ?? '',
      timeZone: json['timezone'] ?? '',
      dateTime: json['datetime'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        utcOffset,
        timeZone,
        dayOfWeek,
        dayOfYear,
        dateTime,
        utcDateTime,
        unixTime,
        rawOffSet,
        weekNumber,
        dst,
        abbreviation,
        dstOffset,
        dstFrom,
        stUntil,
        clientIp
      ];
}
