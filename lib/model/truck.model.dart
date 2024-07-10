import 'package:equatable/equatable.dart';

class TruckModel extends Equatable {
  final int? id;
  final dynamic serviceProvider;
  final String? serviceProviderId;
  final String? plateNumber;
  final String? brand;
  final String? model;
  final int? year;
  final dynamic currentLocation;
  final dynamic currentLocationId;
  final String? type;

  const TruckModel({
    this.id,
    this.serviceProvider,
    this.serviceProviderId,
    this.plateNumber,
    this.brand,
    this.model,
    this.year,
    this.currentLocation,
    this.currentLocationId,
    this.type,
  });

  factory TruckModel.fromJson(Map<String, dynamic> json) => TruckModel(
        id: json['id'] as int?,
        serviceProvider: json['serviceProvider'] as dynamic,
        serviceProviderId: json['serviceProviderId'] as String?,
        plateNumber: json['plateNumber'] as String?,
        brand: json['brand'] as String?,
        model: json['model'] as String?,
        year: json['year'] as int?,
        currentLocation: json['currentLocation'] as dynamic,
        currentLocationId: json['currentLocationId'] as dynamic,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'serviceProvider': serviceProvider,
        'serviceProviderId': serviceProviderId,
        'plateNumber': plateNumber,
        'brand': brand,
        'model': model,
        'year': year,
        'currentLocation': currentLocation,
        'currentLocationId': currentLocationId,
        'type': type,
      };

  @override
  List<Object?> get props {
    return [
      id,
      serviceProvider,
      serviceProviderId,
      plateNumber,
      brand,
      model,
      year,
      currentLocation,
      currentLocationId,
      type,
    ];
  }
}
