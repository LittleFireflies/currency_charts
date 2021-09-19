import 'package:currency_charts/data/api/api_service.dart';
import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/repositories/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final ApiService apiService;

  CurrencyRepositoryImpl({required this.apiService});

  @override
  Future<Currency> getCurrenciesData() async {
    final data = await apiService.getCurrencyData();
    return data.toEntity();
  }
}
