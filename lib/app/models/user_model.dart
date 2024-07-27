import 'package:mvvm_getx_pattern/app/enums/role.enum.dart';

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
  Role? roleName;
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.password,
    this.token,
    this.role,
    this.roleName,
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
    Role? roleName,
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
      roleName: roleName ?? this.roleName,
    );
  }

  toCreateUser() {
    return {
      "nama": name,
      "nomor_telepon": phone,
      "password": password,
      "role_id": roleName!.id,
    };
  }

  @override
  String toString() => 'UserModel(id: $id)';
}
