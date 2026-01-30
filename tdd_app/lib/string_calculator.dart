class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    String numbersToProcess = numbers;
    var delimiters = [',', '\n'];

    if (numbers.startsWith("//")) {
      final parts = numbers.split('\n');
      var delimiterPart = parts[0].substring(2);

      final matches = RegExp(r'\[(.*?)\]').allMatches(delimiterPart);
      if (matches.isNotEmpty) {
        for (final match in matches) {
          delimiters.add(match.group(1)!);
        }
      } else {
        delimiters.add(delimiterPart);
      }
      numbersToProcess = parts.sublist(1).join('\n');
    }

    final pattern = delimiters.map(RegExp.escape).join('|');
    final numList = numbersToProcess
        .split(RegExp(pattern))
        .where(
          (s) => s.isNotEmpty,
        ) // Split might return empty strings if delimiters are adjacent or at ends
        .map(int.parse)
        .toList();

    final negatives = numList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed: ${negatives.join(', ')}');
    }

    return numList.where((n) => n <= 1000).reduce((a, b) => a + b);
  }
}
