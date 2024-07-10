import 'package:equatable/equatable.dart';

class ServiceProvider extends Equatable {
  final String? id;
  final String? userName;
  final String? email;
  final dynamic token;
  final String? role;
  final String? phoneNumber;
  final bool? emailConfirmed;
  final int? moveCounter;
  final String? userImgUrl;
  final bool? suspended;

  const ServiceProvider({
    this.id,
    this.userName,
    this.email,
    this.token,
    this.role,
    this.phoneNumber,
    this.emailConfirmed,
    this.moveCounter,
    this.userImgUrl,
    this.suspended,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as dynamic,
      role: json['role'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      emailConfirmed: json['emailConfirmed'] as bool?,
      moveCounter: json['moveCounter'] as int?,
      userImgUrl: json['userImgURL'] as String?,
      suspended: json['suspended'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'email': email,
        'token': token,
        'role': role,
        'phoneNumber': phoneNumber,
        'emailConfirmed': emailConfirmed,
        'moveCounter': moveCounter,
        'userImgURL': userImgUrl,
        'suspended': suspended,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userName,
      email,
      token,
      role,
      phoneNumber,
      emailConfirmed,
      moveCounter,
      userImgUrl,
      suspended,
    ];
  }
}
