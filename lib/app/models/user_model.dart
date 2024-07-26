class RoleModel {
  int? id;
  String? name;
  RoleModel({this.id, this.name});

  @override
  String toString() {
    return 'RoleModel(id: $id, name: $name)';
  }
}

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? password;
  String? token;
  RoleModel? role;
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.password,
    this.token,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id_user'],
        name: json['nama'],
        phone: json['nomor_telepon'],
        password: json['password'],
        token: json['token'],
      );

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? password,
    String? token,
    RoleModel? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      token: token ?? this.token,
      role: role ?? this.role,
    );
  }

  @override
  String toString() => 'UserModel(id: $id)';
}
