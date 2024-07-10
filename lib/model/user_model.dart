class UserModel {
  String? userName, email, token, role, id;
  String? phoneNumber, imgURL;
  bool emailConfirmed, suspended;
  int counter;
  UserModel(
      {required this.userName,
      required this.email,
      required this.counter,
      required this.emailConfirmed,
      required this.suspended,
      required this.imgURL,
      required this.token,
      required this.role,
      required this.id,
      required this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'],
          email: json['email'],
          token: json['token'],
          emailConfirmed: json['emailConfirmed'],
          role: json['role'],
          suspended: json['suspended'],
          counter: json['moveCounter'],
          imgURL: json['userImgURL'],
          id: json['id'],
          phoneNumber: json['phoneNumber'],
        );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'moveCounter': counter,
        'userImgURL': imgURL,
        'emailConfirmed': emailConfirmed,
        'token': token,
        'role': role,
        'id': id,
        'suspended': suspended,
        'phoneNumber': phoneNumber,
      };
  void updateFromJson(Map<String, dynamic> json) {
    if (json.containsKey('userName')) userName = json['userName'];
    if (json.containsKey('email')) email = json['email'];
    // if (json.containsKey('token')) token = json['token'];
    if (json.containsKey('emailConfirmed')) {
      emailConfirmed = json['emailConfirmed'];
    }
    if (json.containsKey('role')) role = json['role'];
    if (json.containsKey('suspended')) suspended = json['suspended'];
    if (json.containsKey('moveCounter')) counter = json['moveCounter'];
    if (json.containsKey('userImgURL')) imgURL = json['userImgURL'];
    if (json.containsKey('id')) id = json['id'];
    if (json.containsKey('phoneNumber')) phoneNumber = json['phoneNumber'];
  }

  void copyFrom(UserModel other) {
    userName = other.userName;
    email = other.email;
    // token = other.token;
    role = other.role;
    id = other.id;
    phoneNumber = other.phoneNumber;
    imgURL = other.imgURL;
    emailConfirmed = other.emailConfirmed;
    suspended = other.suspended;
    counter = other.counter;
  }
}
