import '../models/company.dart';
import '../repository/company_repository.dart';

class GetCompaniesUseCase {
  final CompanyRepository repository;

  GetCompaniesUseCase(this.repository);

  Future<List<Company>> call() {
    return repository.getCompanies();
  }
}




