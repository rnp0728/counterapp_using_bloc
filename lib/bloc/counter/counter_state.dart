part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue']?.toInt() ?? 0 ,
    );
  }
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}

class CounterIncrement extends CounterState{
  const CounterIncrement(int incrementValue) : super(counterValue: incrementValue);
}

class CounterDecrement extends CounterState{
  const CounterDecrement(int decrementValue) : super(counterValue: decrementValue);
}
