import '../../domain/models/company.dart';
import '../../domain/repository/company_repository.dart';
import '../datasource/company_local_datasource.dart';
import '../mapper/company_mapper.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyLocalDataSource dataSource;

  CompanyRepositoryImpl(this.dataSource);

  @override
  Future<List<Company>> getCompanies() async {
    final dtos = await dataSource.fetchCompanies();
    return dtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<void> addCompany(Company company) async {
    final dto = company.toDto();
    await dataSource.addCompany(dto);
  }
}