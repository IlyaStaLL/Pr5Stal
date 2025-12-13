import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../model/company_model.dart';
import '../add_company/add_company_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:get_it/get_it.dart';
import '../../service/data_service.dart';

import '../../bloc/company_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/company.dart';
import '../../presentation/bloc/company_cubit.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  // final List<CompanyModel> _companies = [
  //   CompanyModel(
  //     name: 'МИРЭА',
  //     category: 'Учебные заведения',
  //     address: 'Кампус на Проспекте Вернадского, 78',
  //     phone: '+7 (499) 600-80-80',
  //     hours: '09:00-21:00',
  //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJEe5coHTy1uAFzlvJiKUHYEOJm-aGjbUfTA&s',
  //   ),
  //   CompanyModel(
  //     name: 'Вкусно - и точка',
  //     category: 'Общепит',
  //     address: 'ул. Покрышкина, 2',
  //     phone: '+7 495 785-14-22',
  //     hours: '07:00-00:00',
  //     imageUrl: 'https://yt3.googleusercontent.com/ndjE74nX_s7aRj-xx1s6t0KvnPCkdC9xzhpnd_RkIL79FfQERT_UwdnqjMRsUnPphJu5nM_ebQ=s900-c-k-c0x00ffffff-no-rj',
  //   ),
  //   CompanyModel(
  //     name: 'Яндекс',
  //     category: 'IT-компании',
  //     address: 'ул. Льва Толстого, 16',
  //     phone: '+7 (495) 739-70-00',
  //     hours: '10:00-19:00',
  //     imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Yandex_icon.svg/1200px-Yandex_icon.svg.png',
  //   ),
  //   CompanyModel(
  //     name: 'Сбер',
  //     category: 'Услуги',
  //     address: 'ул. Вавилова, 19',
  //     phone: '900',
  //     hours: '09:00-18:00',
  //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKMQj_ezF_MlKzPtxTqUIMn3YPgPOEmHGx-w&s',
  //   ),
  //   CompanyModel(
  //     name: 'Почта России',
  //     category: 'Услуги',
  //     address: 'Варшавское ш., 37',
  //     phone: '8 (800) 100-00-00',
  //     hours: '08:00-20:00',
  //     imageUrl: 'https://play-lh.googleusercontent.com/9cJ0zkM1_JlYOKFiRh-ntbrLR1233Az0apAhrF6W61dOpjUaYp1-ohSHU5Gr00NzJg',
  //   ),
  // ];
  String _selectedCategory = 'Все';
  final List<String> _categories = ['Все', 'Учебные заведения', 'Общепит', 'Услуги', 'IT-компании'];

  void _addCompany() {
    context.push('/add_company');
  }

  List<Company> _filterCompanies(List<Company> companies) {
    if (_selectedCategory == 'Все') {
      return companies;
    }
    return companies.where((c) => c.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text('Поиск компаний'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF00D3E6)),
            onPressed: _addCompany,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: _categories.map((category) {
                return FilterChip(
                  label: Text(category),
                  selected: _selectedCategory == category,
                  onSelected: (selected) {
                    if (selected) setState(() => _selectedCategory = category);
                  },
                  selectedColor: const Color(0xFF00D3E6),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: BlocBuilder<CompanyCubit, CompanyState>(
              builder: (context, state) {
                final filtered = _filterCompanies(state.companies);
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final company = filtered[index];
                    return ListTile(
                      leading: SizedBox(
                        width: 50, height: 50,
                        child: CachedNetworkImage(
                          imageUrl: company.imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => const CircularProgressIndicator(),
                          errorWidget: (_, __, ___) => const Icon(Icons.error),
                        ),
                      ),
                      title: Text(company.name),
                      subtitle: Text(company.address),
                      onTap: () => context.push('/detail', extra: company),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}