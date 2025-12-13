import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/company.dart';
import '../../domain/usecases/add_company_usecase.dart';
import '../../domain/usecases/get_companies_usecase.dart';

class CompanyState {
  final List<Company> companies;
  const CompanyState({this.companies = const []});
}

class CompanyCubit extends Cubit<CompanyState> {
  final GetCompaniesUseCase getCompaniesUseCase;
  final AddCompanyUseCase addCompanyUseCase;

  CompanyCubit(this.getCompaniesUseCase, this.addCompanyUseCase)
      : super(const CompanyState()) {
    loadCompanies();
  }

  Future<void> loadCompanies() async {
    final companies = await getCompaniesUseCase();
    emit(CompanyState(companies: companies));
  }

  Future<void> addCompany(Company company) async {
    await addCompanyUseCase(company);
    await loadCompanies();
  }
}



