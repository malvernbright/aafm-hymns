import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, double> {
  CounterBloc() : super(12.0) {
    on<Increment>((event, emit) => state == 20 ? emit(state) : emit(state + 1));
    on<Decrement>((event, emit) => state == 12 ? emit(state) : emit(state - 1));
  }
}
