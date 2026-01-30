import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app/features/string_calculator/domain/string_calculator.dart';

void main() {
  group('String Calculator Tests', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    /// Test Case 1: Empty String
    /// Input: ""
    /// Output: 0
    test('should return 0 when the input string is empty', () {
      expect(calculator.add(""), 0);
    });

    /// Test Case 2: Single Number
    /// Input: "1"
    /// Output: 1
    test(
      'should return the number itself when the input contains a single number',
      () {
        expect(calculator.add("1"), 1);
      },
    );

    /// Test Case 3: Two Numbers
    /// Input: "1,2"
    /// Output: 3
    test('should return the sum of two comma-separated numbers', () {
      expect(calculator.add("1,2"), 3);
    });

    /// Test Case 4: Multiple Numbers
    /// Input: "1,2,3,4,5"
    /// Output: 15
    test('should return the sum of an unknown amount of numbers', () {
      expect(calculator.add("1,2,3,4,5"), 15);
    });

    /// Test Case 5: New Line Delimiter
    /// Input: "1\n2,3"
    /// Output: 6
    test('should handle new lines between numbers as valid delimiters', () {
      expect(calculator.add("1\n2,3"), 6);
    });

    /// Test Case 6: Custom Delimiter
    /// Input: "//;\n1;2"
    /// Output: 3
    test(
      'should support custom delimiters defined in the format "//[delimiter]\n"',
      () {
        expect(calculator.add("//;\n1;2"), 3);
      },
    );

    /// Test Case 7: Negative Numbers
    /// Input: "1,-2,3"
    /// Output: Exception("negative numbers not allowed: -2")
    test(
      'should throw an exception with a message when a negative number is passed',
      () {
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
      },
    );

    /// Test Case 8: Multiple Negative Numbers
    /// Input: "1,-2,-3,4"
    /// Output: Exception("negative numbers not allowed: -2, -3")
    test('should list all negative numbers in the exception message', () {
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

    /// Test Case 9: Numbers Greater Than 1000
    /// Input: "2,1001"
    /// Output: 2
    test('should ignore numbers greater than 1000', () {
      expect(calculator.add("2,1001"), 2);
    });

    /// Test Case 10: Standard Custom Delimiter Length
    /// Input: "//[***]\n1***2***3"
    /// Output: 6
    test('should support custom delimiters of any length', () {
      expect(calculator.add("//[***]\n1***2***3"), 6);
    });

    /// Test Case 11: Multiple Custom Delimiters
    /// Input: "//[*][%]\n1*2%3"
    /// Output: 6
    test('should support multiple custom delimiters', () {
      expect(calculator.add("//[*][%]\n1*2%3"), 6);
    });

    /// Test Case 12: Multiple Long Custom Delimiters
    /// Input: "//[**][%%]\n1**2%%3"
    /// Output: 6
    test(
      'should support multiple custom delimiters with length longer than one char',
      () {
        expect(calculator.add("//[**][%%]\n1**2%%3"), 6);
      },
    );
  });
}
