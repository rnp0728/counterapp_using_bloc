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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Center(
                    child: BlocConsumer<CounterBloc, CounterState>(
                  listener: (context, state) {
                    if (state is CounterIncrement) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Successfully Increased'),
                        duration: Duration(milliseconds: 300),
                      ));
                    } else if (state is CounterDecrement) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Successfully Decreased'),
                        duration: Duration(milliseconds: 300),
                      ));
                    }
                  },
                  builder: (context, state) {
                    return Text('Counter Value = ${state.counterValue}');
                  },
                )),
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
              ])),
        ));
  }
}
