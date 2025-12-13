import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/company_model.dart';


class CompanyState {
  final List<CompanyModel> companies;


  const CompanyState({this.companies = const []});
}

// Cubit
class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(const CompanyState(companies: [])) {
    _loadInitialData();
  }

  void _loadInitialData() {

    final initialCompanies = [
      CompanyModel(
        name: 'МИРЭА',
        category: 'Учебные заведения',
        address: 'Кампус на Проспекте Вернадского, 78',
        phone: '+7 (499) 600-80-80',
        hours: '09:00-21:00',
        imageUrl: 'https://www.mirea.ru/upload/medialibrary/17a/mirea_logo_s.png',
      ),
      CompanyModel(
        name: 'Яндекс',
        category: 'IT-компании',
        address: 'ул. Льва Толстого, 16',
        phone: '+7 (495) 739-70-00',
        hours: '10:00-19:00',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Yandex_icon.svg/1200px-Yandex_icon.svg.png',
      ),
    ];
    emit(CompanyState(companies: initialCompanies));
  }

  void addCompany(CompanyModel company) {
    final updatedList = List<CompanyModel>.from(state.companies)..add(company);
    emit(CompanyState(companies: updatedList));
  }
}