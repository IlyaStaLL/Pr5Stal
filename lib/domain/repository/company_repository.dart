import '../models/company.dart';

abstract class CompanyRepository {
  Future<List<Company>> getCompanies();
  Future<void> addCompany(Company company);
}