import 'package:equatable/equatable.dart';

import 'service_provider.model.dart';

class Truck extends Equatable {
  final int? id;
  final ServiceProvider? serviceProvider;
  final String? serviceProviderId;
  final String? plateNumber;
  final String? brand;
  final String? model;
  final int? year;
  final dynamic currentLocation;
  final int? currentLocationId;
  final String? type;

  const Truck({
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

  factory Truck.fromJson(Map<String, dynamic> json) => Truck(
        id: json['id'] as int?,
        serviceProvider: json['serviceProvider'] == null
            ? null
            : ServiceProvider.fromJson(
                json['serviceProvider'] as Map<String, dynamic>),
        serviceProviderId: json['serviceProviderId'] as String?,
        plateNumber: json['plateNumber'] as String?,
        brand: json['brand'] as String?,
        model: json['model'] as String?,
        year: json['year'] as int?,
        currentLocation: json['currentLocation'] as dynamic,
        currentLocationId: json['currentLocationId'] as int?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'serviceProvider': serviceProvider?.toJson(),
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
