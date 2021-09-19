import 'dart:math';

import 'package:currency_charts/data/models/currency_dto.dart';
import 'package:currency_charts/domain/entities/currency_history.dart';
import 'package:currency_charts/utils/interval.dart';

abstract class ApiService {
  Future<CurrencyDto> getCurrencyData({required ChartsInterval interval});
}

class ApiRandomService implements ApiService {
  static const double _currentValues = 47884.20;
  final double maxUpsDownsPercentage = 10 / 100;

  @override
  Future<CurrencyDto> getCurrencyData({required ChartsInterval interval}) {
    return Future.delayed(Duration(milliseconds: 1500), () {
      return CurrencyDto('BTC', _getRandomizedData(interval));
    });
  }

  List<CurrencyHistory> _getRandomizedData(ChartsInterval interval) {
    final currenciesHistories = <CurrencyHistory>[
      CurrencyHistory(DateTime.now(), _currentValues),
    ];
    final randomizer = Random();

    for (var i = 0; i < 10; i++) {
      final currentValue = currenciesHistories[i];
      final maxUpsDowns = maxUpsDownsPercentage * currentValue.value;
      final maxValue = currentValue.value + maxUpsDowns;
      final minValue = currentValue.value - maxUpsDowns;
      final newValue = _doubleInRange(randomizer, minValue, maxValue);

      currenciesHistories.add(CurrencyHistory(
          DateTime.now().subtract(_getDateTimeInteval(interval, (i + 1))),
          newValue));
    }

    return currenciesHistories;
  }

  Duration _getDateTimeInteval(ChartsInterval interval, int multiplier) {
    switch (interval) {
      case ChartsInterval.Day_1:
        return Duration(days: 1 * multiplier);
      case ChartsInterval.Week_1:
        return Duration(days: 7 * multiplier);
      case ChartsInterval.Month_1:
        return Duration(days: 30 * multiplier);
      case ChartsInterval.Month_6:
        return Duration(days: 180 * multiplier);
    }
  }

  double _doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
}
