import 'package:flutter/material.dart';

import '../bloc/bloc_imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App using BLoC'),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Counter Value = ${state.counterValue}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context
                              .read<CounterBloc>()
                              .add(CounterDecrementEvent()),
                          child: const Text('Decrement'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => context
                              .read<CounterBloc>()
                              .add(CounterIncrementEvent()),
                          child: const Text('Increment'),
                        ),
                      ],
                    ),
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
