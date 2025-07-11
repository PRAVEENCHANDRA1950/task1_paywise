class UserModel {
  String name;
  String mobile;
  String pin;

  UserModel({required this.name, required this.mobile, required this.pin});

  Map<String, dynamic> toJson() => {
        'name': name,
        'mobile': mobile,
        'pin': pin,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        mobile: json['mobile'],
        pin: json['pin'],
      );
}
