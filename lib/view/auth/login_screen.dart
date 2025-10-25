import 'package:flutter/material.dart';
import '../main/home_screen.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;
  bool _rememberMe = false;

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }


  void _goToRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const RegisterScreen()),
    );
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
                          'Вход в справочник',

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),

                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: _emailController,
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black),

                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: Icon(Icons.alternate_email, color: Color(0xFFBBBBBB)),
                            filled: true,

                            fillColor: Color(0x00D3E6FF),
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Введите email';
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                              return 'Некорректный email!';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscure,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Пароль',

                            labelStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                            prefixIcon: const Icon(Icons.key, color: Color(0xFFBBBBBB)),

                            suffixIcon: IconButton(
                              onPressed: _toggleObscure,
                              icon: Icon(
                                _obscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                                color: const Color(0xFFBBBBBB),
                              ),
                            ),

                            filled: true,
                            fillColor: const Color(0x00D3E6FF),
                            border: const OutlineInputBorder(),
                          ),

                          validator: (v) {
                            if (v == null || v.length < 6) return 'Минимум 6 символов';
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,

                              onChanged: (val) {
                                setState(() => _rememberMe = val ?? false);
                              },
                              activeColor: const Color(0xFF00D3E6),
                            ),
                            const Text(
                              'Запомнить меня',
                              style: TextStyle(color: Color(0xFFBBBBBB)),
                            ),
                          ],
                        ),


                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _onLoginPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00D3E6),
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Войти',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),


                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: _goToRegister,
                          child: const Text(
                            'Нет аккаунта? Зарегистрироваться',
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


