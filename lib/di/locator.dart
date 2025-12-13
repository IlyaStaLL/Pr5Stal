import 'package:get_it/get_it.dart';
import '../data/datasource/company_local_datasource.dart';
import '../data/repository/company_repository_impl.dart';
import '../domain/repository/company_repository.dart';
import '../domain/usecases/add_company_usecase.dart';
import '../domain/usecases/get_companies_usecase.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CompanyLocalDataSource>(() => CompanyLocalDataSource());

  locator.registerLazySingleton<CompanyRepository>(
          () => CompanyRepositoryImpl(locator<CompanyLocalDataSource>()));

  locator.registerLazySingleton<GetCompaniesUseCase>(
          () => GetCompaniesUseCase(locator<CompanyRepository>()));
  locator.registerLazySingleton<AddCompanyUseCase>(
          () => AddCompanyUseCase(locator<CompanyRepository>()));
}