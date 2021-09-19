import 'package:currency_charts/presentation/bloc/currency/currency_bloc.dart';
import 'package:currency_charts/presentation/pages/currency_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currency_charts/injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.locator<CurrencyBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CurrencyPage(),
      ),
    );
  }
}
