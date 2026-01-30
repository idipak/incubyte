import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app/string_calculator.dart';

void main() {
  test('String Calculator exists', () {
    final calculator = StringCalculator();
    expect(calculator, isNotNull);
  });
  test('returns 0 for empty string', () {
    final calculator = StringCalculator();
    expect(calculator.add(""), 0);
  });
  test('returns number for single number string', () {
    final calculator = StringCalculator();
    expect(calculator.add("1"), 1);
  });
  test('returns sum for two comma-separated numbers', () {
    final calculator = StringCalculator();
    expect(calculator.add("1,2"), 3);
  });
  test('returns sum for multiple comma-separated numbers', () {
    final calculator = StringCalculator();
    expect(calculator.add("1,2,3,4,5"), 15);
  });
  test('returns sum for numbers separated by new line', () {
    final calculator = StringCalculator();
    expect(calculator.add("1\n2,3"), 6);
  });
  test('supports custom delimiter', () {
    final calculator = StringCalculator();
    expect(calculator.add("//;\n1;2"), 3);
  });
  test('throws exception for negative numbers', () {
    final calculator = StringCalculator();
    expect(
      () => calculator.add("1,-2,3"),
      throwsA(
        predicate(
          (e) =>
              e is Exception &&
              e.toString().contains('negative numbers not allowed: -2'),
        ),
      ),
    );
  });
  test('throws exception for multiple negative numbers listing all', () {
    final calculator = StringCalculator();
    expect(
      () => calculator.add("1,-2,-3,4"),
      throwsA(
        predicate(
          (e) =>
              e is Exception &&
              e.toString().contains('negative numbers not allowed: -2, -3'),
        ),
      ),
    );
  });
  test('ignores numbers greater than 1000', () {
    final calculator = StringCalculator();
    expect(calculator.add("2,1001"), 2);
  });
  test('supports delimiters of any length', () {
    final calculator = StringCalculator();
    expect(calculator.add("//[***]\n1***2***3"), 6);
  });
  test('supports multiple delimiters', () {
    final calculator = StringCalculator();
    expect(calculator.add("//[*][%]\n1*2%3"), 6);
  });
  test('supports multiple long delimiters', () {
    final calculator = StringCalculator();
    expect(calculator.add("//[**][%%]\n1**2%%3"), 6);
  });
}