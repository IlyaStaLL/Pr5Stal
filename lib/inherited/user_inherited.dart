import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserInherited extends InheritedWidget {
  final UserModel user;

  const UserInherited({
    super.key,
    required this.user,
    required super.child,
  });

  static UserInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserInherited>();
  }

  @override
  bool updateShouldNotify(UserInherited oldWidget) {
    return oldWidget.user.email != user.email;
  }
}