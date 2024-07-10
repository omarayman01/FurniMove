import 'package:equatable/equatable.dart';

class ApplianceModel extends Equatable {
  final int? id;
  final String? description;
  final int? moveRequestId;
  final String? imgUrl;
  final List<String>? tags;

  const ApplianceModel({
    this.id,
    this.description,
    this.moveRequestId,
    this.imgUrl,
    this.tags,
  });

  factory ApplianceModel.fromJson(Map<String, dynamic> json) => ApplianceModel(
        id: json['id'] as int?,
        description: json['description'] as String?,
        moveRequestId: json['moveRequestId'] as int?,
        imgUrl: json['imgURL'] as String?,
        tags: (json['tags'] as List<dynamic>?)
            ?.map((tag) => tag as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'moveRequestId': moveRequestId,
        'imgURL': imgUrl,
        'tags': tags,
      };

  @override
  List<Object?> get props {
    return [
      id,
      description,
      moveRequestId,
      imgUrl,
      tags,
    ];
  }
}
