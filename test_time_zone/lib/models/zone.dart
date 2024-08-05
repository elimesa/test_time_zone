import 'package:equatable/equatable.dart';

import 'details_zone.dart';

class Zone extends Equatable {
  final List<String>? nameTimeZone;

  const Zone({
    required this.nameTimeZone
  });

  @override
  List<Object?> get props => [nameTimeZone];

}