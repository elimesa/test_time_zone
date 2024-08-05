import 'package:equatable/equatable.dart';

import 'details_zone.dart';

class TimeZone extends Equatable {
  final List<DetailsZone>? detailsZone;

  const TimeZone({
    this.detailsZone
  });

  @override
  List<Object?> get props => [detailsZone];

}