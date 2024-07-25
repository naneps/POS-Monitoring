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
}
