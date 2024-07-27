enum Role {
  owner,
  officer,
}

extension RoleExtension on Role {
  int get id {
    switch (this) {
      case Role.owner:
        return 1;
      case Role.officer:
        return 2;
    }
  }

  String get name {
    switch (this) {
      case Role.owner:
        return "Owner";
      case Role.officer:
        return "Officer";
    }
  }
}
