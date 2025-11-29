import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


//GetIt getIt = GetIt.instance;

GetIt.I.registerSingleton<AppModel>(AppModelImplementation());


class MyLogic extends InheritedWidget {
  const MyLogic({super.key, required super.child});

  static MyLogic? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyLogic>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

}


class MyInherited extends InheritedWidget {

  final String data;

  const MyInherited({
    super.key,
    required this.data,
    required super.child,
  });

  static MyInherited of(BuildContext context) {
    final MyInherited? result = context.dependOnInheritedWidgetOfExactType<MyInherited>();
    assert(result != null, 'No MyInherited found in context');
    return result!;

  }
  var myAppModel = GetIt.I<AppModel>();


  @override
  bool updateShouldNotify(MyInherited oldWidget) {
    return oldWidget.data != data;
  }
}

class AppModel {
}