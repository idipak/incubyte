import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/string_calculator_bloc.dart';
import '../bloc/string_calculator_event.dart';
import '../bloc/string_calculator_state.dart';

class StringCalculatorPage extends StatelessWidget {
  const StringCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('String Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter numbers (comma separated)',
                hintText: 'e.g., 1,2 or 1\\n2,3',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiline for easier input of newlines
              onChanged: (value) {
                context.read<StringCalculatorBloc>().add(CalculateSum(value));
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<StringCalculatorBloc, StringCalculatorState>(
              builder: (context, state) {
                if (state is StringCalculatorLoading) {
                  return const CircularProgressIndicator();
                } else if (state is StringCalculatorLoaded) {
                  return Text(
                    'Result: ${state.result}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state is StringCalculatorError) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  );
                }
                return Text(
                  'Result: 0',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
