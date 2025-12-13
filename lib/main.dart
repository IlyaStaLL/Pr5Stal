import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/di/locator.dart';
import 'package:untitled/presentation/bloc/company_cubit.dart';
import 'package:untitled/router/app_router.dart';
import 'package:untitled/domain/usecases/get_companies_usecase.dart';
import 'package:untitled/domain/usecases/add_company_usecase.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyCubit(
        locator<GetCompaniesUseCase>(),
        locator<AddCompanyUseCase>(),
      ),
      child: MaterialApp.router(
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
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D3E6),
              foregroundColor: Colors.black,
            ),
          ),
        ),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}