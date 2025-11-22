import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/company_model.dart';
import '../view/auth/login_screen.dart';
import '../view/auth/register_screen.dart';
import '../view/main/home_screen.dart';
import '../view/add_company/add_company_screen.dart';
import '../view/detail/company_detail_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),


    GoRoute(
      path: '/add_company',
      builder: (context, state) => const AddCompanyScreen(),
    ),

    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final company = state.extra as CompanyModel;
        return CompanyDetailScreen(company: company);
      },
    ),
  ],
);