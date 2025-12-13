import '../models/company.dart';
import '../repository/company_repository.dart';

class AddCompanyUseCase {
  final CompanyRepository repository;

  AddCompanyUseCase(this.repository);

  Future<void> call(Company company) {
    return repository.addCompany(company);
  }
}