import '../../domain/models/company.dart';
import '../dto/company_dto.dart';

extension CompanyDtoMapper on CompanyDto {
  Company toDomain() {
    return Company(
      id: id,
      name: name,
      category: category,
      address: address,
      phone: phone,
      hours: hours,
      imageUrl: imageUrl,
    );
  }
}

extension CompanyDomainMapper on Company {
  CompanyDto toDto() {
    return CompanyDto(
      id: id,
      name: name,
      category: category,
      address: address,
      phone: phone,
      hours: hours,
      imageUrl: imageUrl,
    );
  }
}