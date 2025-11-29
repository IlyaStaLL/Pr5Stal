import 'package:flutter/material.dart';
import '../../inherited/user_inherited.dart';
import '../../model/user_model.dart';
import '../profile/profile_fragment.dart';
import '../search/search_fragment.dart';
import '../settings/settings_fragment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const SearchFragment(),
    const ProfileFragment(),
    const SettingsFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = UserModel(name: 'Стальский Илья', email: 'email@example.com');

    return UserInherited(
      user: user,
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          backgroundColor: const Color(0xFFFFFFFF),
          selectedItemColor: const Color(0xFF00D3E6),

          unselectedItemColor: const Color(0xFF8B8B8B),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Поиск',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Аккаунт',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Настройки',
            ),
          ],
        ),
      ),
    );
  }
}