import 'package:equatable/equatable.dart';

class EndLocation extends Equatable {
  final int? id;
  final double? longitude;
  final double? latitude;
  final DateTime? timeStamp;

  const EndLocation({
    this.id,
    this.longitude,
    this.latitude,
    this.timeStamp,
  });

  factory EndLocation.fromJson(Map<String, dynamic> json) => EndLocation(
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
