import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../model/company_model.dart';
import '../add_company/add_company_screen.dart';
import 'package:go_router/go_router.dart';



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
      hours: '09:00-21:00',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJEe5coHTy1uAFzlvJiKUHYEOJm-aGjbUfTA&s',
    ),
    CompanyModel(
      name: 'Вкусно - и точка',
      category: 'Общепит',
      address: 'ул. Покрышкина, 2',
      phone: '+7 495 785-14-22',
      hours: '07:00-00:00',
      imageUrl: 'https://yt3.googleusercontent.com/ndjE74nX_s7aRj-xx1s6t0KvnPCkdC9xzhpnd_RkIL79FfQERT_UwdnqjMRsUnPphJu5nM_ebQ=s900-c-k-c0x00ffffff-no-rj',
    ),
    CompanyModel(
      name: 'Яндекс',
      category: 'IT-компании',
      address: 'ул. Льва Толстого, 16',
      phone: '+7 (495) 739-70-00',
      hours: '10:00-19:00',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Yandex_icon.svg/1200px-Yandex_icon.svg.png',
    ),
    CompanyModel(
      name: 'Сбер',
      category: 'Услуги',
      address: 'ул. Вавилова, 19',
      phone: '900',
      hours: '09:00-18:00',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKMQj_ezF_MlKzPtxTqUIMn3YPgPOEmHGx-w&s',
    ),
    CompanyModel(
      name: 'Почта России',
      category: 'Услуги',
      address: 'Варшавское ш., 37',
      phone: '8 (800) 100-00-00',
      hours: '08:00-20:00',
      imageUrl: 'https://play-lh.googleusercontent.com/9cJ0zkM1_JlYOKFiRh-ntbrLR1233Az0apAhrF6W61dOpjUaYp1-ohSHU5Gr00NzJg',
    ),
  ];

  String _selectedCategory = 'Все';
  final List<String> _categories = ['Все', 'Учебные заведения', 'Общепит', 'Услуги', 'IT-компании'];

  void _addCompany() {
    context.push('/add_company');
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
                  label: Text(category, style: TextStyle(color: _selectedCategory == category ? Colors.black : Colors.black)),
                  selected: _selectedCategory == category,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    }
                  },
                  backgroundColor: const Color(0xFFEEEEEE),
                  selectedColor: const Color(0xFF00D3E6),
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
                style: TextStyle(color: Color(0xFF8B8B8B)),
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
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: company.imageUrl,
                          placeholder: (context, url) => const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.business,
                            color: Colors.white,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                      context.push('/detail', extra: company);
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