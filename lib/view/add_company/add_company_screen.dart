import 'package:flutter/material.dart';

class AddCompanyScreen extends StatefulWidget {
  const AddCompanyScreen({super.key});

  @override
  State<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();

  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _hoursController = TextEditingController();


  void _onSavePressed() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text('Добавить компанию'),
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: Colors.black,
      ),


      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _nameController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'Название компании',

                        labelStyle: TextStyle(color: Color(0xFFBBBBBB)),
                        prefixIcon: Icon(Icons.business, color: Color(0xFFBBBBBB)),
                        filled: true,
                        fillColor: Color(0xFF222222),

                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.isEmpty) ? 'Введите название' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _categoryController,

                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'Категория',

                        labelStyle: TextStyle(color: Color(0xFFBBBBBB)),
                        prefixIcon: Icon(Icons.category, color: Color(0xFFBBBBBB)),
                        filled: true,
                        fillColor: Color(0xFF222222),

                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.isEmpty) ? 'Введите категорию' : null,

                    ),

                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _addressController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'Адрес',

                        labelStyle: TextStyle(color: Color(0xFFBBBBBB)),
                        prefixIcon: Icon(Icons.location_on_outlined, color: Color(0xFFBBBBBB)),
                        filled: true,
                        fillColor: Color(0xFF222222),
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.isEmpty) ? 'Введите адрес' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,

                      decoration: const InputDecoration(
                        labelText: 'Телефон',
                        labelStyle: TextStyle(color: Color(0xFFBBBBBB)),
                        prefixIcon: Icon(Icons.phone_outlined, color: Color(0xFFBBBBBB)),
                        filled: true,


                        fillColor: Color(0xFF222222),
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.isEmpty) ? 'Введите телефон' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _hoursController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: 'Часы работы',

                        labelStyle: TextStyle(color: Color(0xFFBBBBBB)),
                        prefixIcon: Icon(Icons.access_time, color: Color(0xFFBBBBBB)),
                        filled: true,
                        fillColor: Color(0xFF222222),
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.isEmpty) ? 'Введите часы работы' : null,
                    ),
                    const SizedBox(height: 32),


                    ElevatedButton(
                      onPressed: _onSavePressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D3E6),
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Сохранить',

                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


