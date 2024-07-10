import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final dynamic? id;
  final dynamic? longitude;
  final dynamic? latitude;
  final DateTime? timeStamp;

  const LocationModel({this.id, this.longitude, this.latitude, this.timeStamp});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json['id'] as int?,
        longitude: json['longitude'] as int?,
        latitude: json['latitude'] as int?,
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
