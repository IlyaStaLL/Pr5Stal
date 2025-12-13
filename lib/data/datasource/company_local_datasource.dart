import '../dto/company_dto.dart';

class CompanyLocalDataSource {
  final List<CompanyDto> _data = [
    CompanyDto(
      id: '1',
      name: 'МИРЭА',
      category: 'Учебные заведения',
      address: 'пр. Вернадского, 78',
      phone: '+7 (499) 600-80-80',
      hours: '09:00-21:00',
      imageUrl: 'https://www.mirea.ru/upload/medialibrary/17a/mirea_logo_s.png',
    ),
    CompanyDto(
      id: '2',
      name: 'Яндекс',
      category: 'IT-компании',
      address: 'ул. Льва Толстого, 16',
      phone: '+7 (495) 739-70-00',
      hours: '10:00-19:00',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Yandex_icon.svg/1200px-Yandex_icon.svg.png',
    ),
  ];

  Future<List<CompanyDto>> fetchCompanies() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _data;
  }

  Future<void> addCompany(CompanyDto companyDto) async {
    _data.add(companyDto);
  }
}