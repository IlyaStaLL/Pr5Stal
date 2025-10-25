import 'package:flutter/material.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const CircleAvatar(
                radius: 50,

                backgroundColor: Color(0xFF00D3E6),
                child: Icon(Icons.person, size: 60, color: Colors.black),
              ),
              const SizedBox(height: 16),
              const Text(
                'Стальский Илья', // Имя
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(

                'email@example.com', //Почта
                style: TextStyle(color: Color(0xFFBBBBBB)),
              ),

              const SizedBox(height: 32),
              Container(

                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFFFFF)),
                ),
                child: const ListTile(


                  leading: Icon(Icons.info_outline, color: Color(0xFF00D3E6)),
                  title: Text(
                    'Информация профиля',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(

                    'Статистика, данные, активность',
                    style: TextStyle(color: Color(0xFFBBBBBB)),
                  ),
                  onTap: null,
                ),

              ),

              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D3E6), Color(0xFF3CEAFF)],
                  ),

                  borderRadius: BorderRadius.circular(12),
                ),

                child: ElevatedButton(
                  onPressed: () {
                    //выход из аккаунта
                  },


                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(

                    'Выйти из аккаунта',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



