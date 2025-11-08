import 'package:flutter/material.dart';

class SettingsFragment extends StatefulWidget {
  const SettingsFragment({super.key});

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  bool _notificationsEnabled = true;
  bool _darkTheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text('Настройки'),
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            activeColor: const Color(0xFF00D3E6),
            title: const Text(
              'Уведомления',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              'Получать уведомления о новых компаниях',
              style: TextStyle(color: Color(0xFFBBBBBB)),
            ),
            value: _notificationsEnabled,
            onChanged: (val) {
              setState(() => _notificationsEnabled = val);
              //включение/отключение
            },
          ),
          const Divider(color: Color(0xFFFFFFFF)),
          SwitchListTile(
            activeColor: const Color(0xFF00D3E6),
            title: const Text(
              'Тёмная тема',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              'Изменить внешний вид приложения',
              style: TextStyle(color: Color(0xFFBBBBBB)),
            ),
            value: _darkTheme,
            onChanged: (val) {
              setState(() => _darkTheme = val);
              //смена темы
            },
          ),
          const Divider(color: Color(0xFFFFFFFF)),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF00D3E6)),
            title: const Text(
              'Выйти из аккаунта',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}