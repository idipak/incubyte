class StringCalculator {
  /// Adds numbers from a comma-separated string, supporting custom delimiters.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final (delimiters, payload) = _extractDelimitersAndPayload(numbers);
    final integers = _parseIntegers(payload, delimiters);

    _validateNegatives(integers);

    return _calculateSum(integers);
  }

  /// Extracts delimiters and the actual number string payload.
  (List<String>, String) _extractDelimitersAndPayload(String input) {
    var delimiters = [',', '\n'];
    var payload = input;

    if (input.startsWith("//")) {
      final parts = input.split('\n');
      final delimiterDefinition = parts.first.substring(2);
      payload = parts.sublist(1).join('\n');

      final customDelimiters = _parseCustomDelimiters(delimiterDefinition);
      delimiters.addAll(customDelimiters);
    }

    return (delimiters, payload);
  }

  /// Parses the delimiter definition line.
  List<String> _parseCustomDelimiters(String definition) {
    final matches = RegExp(r'\[(.*?)\]').allMatches(definition);
    if (matches.isNotEmpty) {
      return matches.map((m) => m.group(1)!).toList();
    } else {
      return [definition];
    }
  }

  /// Splits the payload by delimiters and converts to integers.
  List<int> _parseIntegers(String payload, List<String> delimiters) {
    // Escape delimiters to treat them as literal characters in RegExp
    final pattern = delimiters.map(RegExp.escape).join('|');

    return payload
        .split(RegExp(pattern))
        .where((s) => s.isNotEmpty)
        .map(int.parse)
        .toList();
  }

  /// Throws exception if any negative numbers are present.
  void _validateNegatives(List<int> numbers) {
    final negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed: ${negatives.join(', ')}');
    }
  }

  /// Sums numbers less than or equal to 1000.
  int _calculateSum(List<int> numbers) {
    return numbers
        .where((n) => n <= 1000)
        .fold(0, (sum, element) => sum + element);
  }
}
