import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_app/features/string_calculator/domain/string_calculator.dart';
import 'features/string_calculator/presentation/bloc/string_calculator_bloc.dart';
import 'features/string_calculator/presentation/pages/string_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator TDD',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => StringCalculatorBloc(StringCalculator()),
        child: const StringCalculatorPage(),
      ),
    );
  }
}
