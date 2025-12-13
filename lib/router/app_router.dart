import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/domain/models/company.dart';
import 'package:untitled/view/auth/login_screen.dart';
import 'package:untitled/view/auth/register_screen.dart';
import 'package:untitled/view/main/home_screen.dart';
import 'package:untitled/view/add_company/add_company_screen.dart';
import 'package:untitled/view/detail/company_detail_screen.dart';
import 'package:untitled/view/profile/profile_fragment.dart';
import 'package:untitled/view/settings/settings_fragment.dart';

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
        final company = state.extra as Company;
        return CompanyDetailScreen(company: company);
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileFragment(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsFragment(),
    ),
  ],
);