import 'package:currency_charts/data/api/api_service.dart';
import 'package:currency_charts/data/repositories/currency_repository_impl.dart';
import 'package:currency_charts/domain/repositories/currency_repository.dart';
import 'package:currency_charts/domain/usecases/get_currencies_data.dart';
import 'package:currency_charts/presentation/bloc/currency/currency_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => CurrencyBloc(getCurrenciesData: locator()),
  );

  // use case
  locator.registerLazySingleton(
    () => GetCurrenciesData(repository: locator()),
  );

  // repository
  locator.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImpl(apiService: locator()),
  );

  // data sources
  locator.registerLazySingleton<ApiService>(
    () => ApiRandomService(),
  );
}
