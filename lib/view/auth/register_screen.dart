import 'package:flutter/material.dart';
import '../main/home_screen.dart';
import 'package:go_router/go_router.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();

  bool _obscure1 = true;
  bool _obscure2 = true;
  bool _acceptTerms = false;

  // void _onRegisterPressed() {
  //   if (!_acceptTerms) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Примите условия использования')),
  //     );
  //     return;
  //   }
  //
  //   if (_formKey.currentState?.validate() ?? false) {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) => const HomeScreen()),
  //     );
  //   }
  // }
  void _onRegisterPressed() {
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Примите условия использования')),
      );
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      context.go('/home');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          'Регистрация',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),


                        const SizedBox(height: 32),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Имя',
                            labelStyle: TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: Icon(Icons.person_outline, color: Color(0xFFBBBBBB)),
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) => (v == null || v.isEmpty) ? 'Введите имя' : null,
                        ),

                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: Icon(Icons.alternate_email, color: Color(0xFFBBBBBB)),
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            border: OutlineInputBorder(),
                          ),


                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Введите email';
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                              return 'Некорректный email';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _password1Controller,
                          obscureText: _obscure1,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Пароль',
                            labelStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: const Icon(Icons.key, color: Color(0xFFBBBBBB)),
                            suffixIcon: IconButton(
                              onPressed: () => setState(() => _obscure1 = !_obscure1),
                              icon: Icon(
                                _obscure1 ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                                color: const Color(0xFFBBBBBB),
                              ),
                            ),

                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (v) {
                            if (v == null || v.length < 8) return 'Минимум 8 символов';
                            return null;
                          },
                        ),


                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _password2Controller,
                          obscureText: _obscure2,

                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Повторите пароль',

                            labelStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: const Icon(Icons.key, color: Color(0xFFBBBBBB)),

                            suffixIcon: IconButton(
                              onPressed: () => setState(() => _obscure2 = !_obscure2),
                              icon: Icon(
                                _obscure2 ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                                color: const Color(0xFFBBBBBB),
                              ),
                            ),

                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (v) {
                            if (v != _password1Controller.text) return 'Пароли не совпадают';
                            return null;
                          },
                        ),

                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Checkbox(
                              value: _acceptTerms,
                              onChanged: (val) {
                                setState(() => _acceptTerms = val ?? false);
                              },

                              activeColor: const Color(0xFF00D3E6),
                            ),

                            const Expanded(
                              child: Text(
                                'Я принимаю условия использования',
                                style: TextStyle(color: Color(0xFFBBBBBB)),
                              ),
                            ),
                          ],
                        ),


                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _onRegisterPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00D3E6),
                            minimumSize: const Size(double.infinity, 48),


                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          child: const Text(
                            'Создать аккаунт',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () => context.pop(),
                          child: const Text(
                            'Уже есть аккаунт? Войти',

                            style: TextStyle(color: Color(0xFFBBBBBB)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


