import '../model/company_model.dart';

class DataService {
  final List<CompanyModel> _companies = [
    CompanyModel(
      name: 'МИРЭА',
      category: 'Учебные заведения',
      address: 'Кампус на Проспекте Вернадского, 78',
      phone: '+7 (499) 600-80-80',
      hours: '09:00-21:00',
      imageUrl: 'https://www.mirea.ru/upload/medialibrary/17a/mirea_logo_s.png',
    ),
    CompanyModel(
      name: 'Вкусно - и точка',
      category: 'Общепит',
      address: 'ул. Покрышкина, 2',
      phone: '+7 495 785-14-22',
      hours: '07:00-00:00',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Vkusno_i_tochka_logo.svg/1200px-Vkusno_i_tochka_logo.svg.png',
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
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Sber_logo_eng.svg/2560px-Sber_logo_eng.svg.png',
    ),
    CompanyModel(
      name: 'Почта России',
      category: 'Услуги',
      address: 'Варшавское ш., 37',
      phone: '8 (800) 100-00-00',
      hours: '08:00-20:00',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Russian_Post_logo.svg/1280px-Russian_Post_logo.svg.png',
    ),
  ];

  List<CompanyModel> get companies => _companies;

  void addCompany(CompanyModel company) {
    _companies.add(company);
  }
}