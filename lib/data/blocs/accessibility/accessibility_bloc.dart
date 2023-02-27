import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'accessibility_event.dart';
part 'accessibility_state.dart';

class AccessibilityBloc extends Bloc<AccessibilityEvent, double> {
  AccessibilityBloc() : super(12) {
    on<AccessibilityIncreaseFontSize>((event, emit) {
      if (state == 20) {
      } else {
        emit(state + 1);
      }
    });
    on<AccessibilityDecreaseFontSize>((event, emit) {
      if (state < 12) {
      } else {
        emit(state - 1);
      }
    });
  }
}
