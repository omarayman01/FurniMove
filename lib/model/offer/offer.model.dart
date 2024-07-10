import 'package:equatable/equatable.dart';

import 'service_provider.model.dart';

class OfferModel extends Equatable {
  final int? id;
  final String? serviceProviderId;
  final ServiceProvider? serviceProvider;
  final int? price;
  final int? moveRequestId;
  final bool? accepted;

  const OfferModel({
    this.id,
    this.serviceProviderId,
    this.serviceProvider,
    this.price,
    this.moveRequestId,
    this.accepted,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json['id'] as int?,
        serviceProviderId: json['serviceProviderId'] as String?,
        serviceProvider: json['serviceProvider'] == null
            ? null
            : ServiceProvider.fromJson(
                json['serviceProvider'] as Map<String, dynamic>),
        price: json['price'] as int?,
        moveRequestId: json['moveRequestId'] as int?,
        accepted: json['accepted'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'serviceProviderId': serviceProviderId,
        'serviceProvider': serviceProvider?.toJson(),
        'price': price,
        'moveRequestId': moveRequestId,
        'accepted': accepted,
      };

  @override
  List<Object?> get props {
    return [
      id,
      serviceProviderId,
      serviceProvider,
      price,
      moveRequestId,
      accepted,
    ];
  }
}
