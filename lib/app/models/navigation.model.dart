import 'package:flutter/material.dart';

class NavigationModel {
  String? title;
  String? route;
  IconData? icon;
  IconData? activeIcon;
  Widget? page;
  NavigationModel({
    this.title,
    this.route,
    this.icon,
    this.activeIcon,
    this.page,
  });
}
