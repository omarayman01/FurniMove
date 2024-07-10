import 'package:equatable/equatable.dart';

class StartLocation extends Equatable {
  final int? id;
  final double? longitude;
  final double? latitude;
  final DateTime? timeStamp;

  const StartLocation({
    this.id,
    this.longitude,
    this.latitude,
    this.timeStamp,
  });

  factory StartLocation.fromJson(Map<String, dynamic> json) => StartLocation(
        id: json['id'] as int?,
        longitude: (json['longitude'] as num?)?.toDouble(),
        latitude: (json['latitude'] as num?)?.toDouble(),
        timeStamp: json['timeStamp'] == null
            ? null
            : DateTime.parse(json['timeStamp'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'longitude': longitude,
        'latitude': latitude,
        'timeStamp': timeStamp?.toIso8601String(),
      };

  @override
  List<Object?> get props => [id, longitude, latitude, timeStamp];
}
