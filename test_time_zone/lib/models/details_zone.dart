import 'dart:ffi';
import 'package:equatable/equatable.dart';

class DetailsZone extends Equatable {
  final  String? utcOffset;
  final  String? timeZone;
  final int? dayOfWeek;
  final int? dayOfYear;
  final  String? dateTime;
  final  String? utcDateTime;
  final  Long? unixTime;
  final int? rawOffSet;
  final int? weekNumber;
  final bool? dst;
  final String? abbreviation;
  final Long? dstOffset;
  final String? dstFrom;
  final String? stUntil;
  final String? clientIp;

  const DetailsZone({
    this.utcOffset,
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

  @override
  List<Object?> get props => [utcOffset,timeZone,dayOfWeek,dayOfYear,
    dateTime,utcDateTime,unixTime,rawOffSet,weekNumber,dst,abbreviation,
    dstOffset,dstFrom,stUntil,clientIp];
}