import 'package:flutter/material.dart';
import '../../model/company_model.dart';
import '../add_company/add_company_screen.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  final List<CompanyModel> _companies = [
    CompanyModel(
      name: 'МИРЭА',
      category: 'Учебные заведения',
      address: 'Кампус на Проспекте Вернадского, 78',
      phone: '+7 (499) 600-80-80',
      hours: '09.00-21.00',
    ),



    CompanyModel(
      name: 'Вкусно - и точка',
      category: 'Общепит',
      address: 'ул. Покрышкина, 2',
      phone: '+7 495 785-14-22',
      hours: '07:00–00:00',
    ),
  ];

  String _selectedCategory = 'Все';
  final List<String> _categories = ['Все', 'Учебные заведения', 'Общепит', 'Услуги'];

  void _addCompany() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AddCompanyScreen()),
    );
//
  }

  List<CompanyModel> get _filteredCompanies {
    if (_selectedCategory == 'Все') {
      return _companies;
    }

    return _companies.where((c) => c.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text('Поиск компаний'),
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF00D3E6)),
            tooltip: 'Добавить компанию',
            onPressed: _addCompany,
          ),
        ],
      ),



      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _categories.map((category) {
                return FilterChip(
                  label: Text(category),
                  selected: _selectedCategory == category,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    }
                  },

                  backgroundColor: const Color(0xFFFFFFFF),
                  selectedColor: const Color(0xFF00D3E6),
                  labelStyle: const TextStyle(color: Colors.black),
                  checkmarkColor: Colors.black,
                );
              }).toList(),
            ),
          ),



          Expanded(
            child: _filteredCompanies.isEmpty
                ? const Center(
              child: Text(
                'Нет компаний в этой категории',
                style: TextStyle(color: Color(0xFFBBBBBB)),
              ),
            )
                : ListView.separated(
              padding: const EdgeInsets.all(16),

              itemCount: _filteredCompanies.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final company = _filteredCompanies[index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF000000),

                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFFFFFFF)),
                  ),
                  child: ListTile(
                    title: Text(
                      company.name,
                      style: const TextStyle(color: Colors.white),
                    ),

                    subtitle: Text(
                      '${company.address}\n${company.phone}',
                      style: const TextStyle(color: Color(0xFFBBBBBB)),
                    ),

                    isThreeLine: true,
                    onTap: () {

                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
