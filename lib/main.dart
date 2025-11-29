import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'service/data_service.dart';

import 'package:get_it/get_it.dart';


void main() {
  setupLocator();
  runApp(const MyApp());
}


void setupLocator() {
  GetIt.I.registerSingleton<DataService>(DataService());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Справочник',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF00D3E6),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),

          foregroundColor: Colors.black,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Color(0xFFF5F5F5),
          labelStyle: TextStyle(color: Color(0xFF8B8B8B)),
          prefixIconColor: Color(0xFF8B8B8B),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00D3E6),
            foregroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      routerConfig: router,

      debugShowCheckedModeBanner: false,
    );
  }
}









