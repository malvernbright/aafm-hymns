part of 'accessibility_bloc.dart';

@immutable
abstract class AccessibilityEvent extends Equatable {
  const AccessibilityEvent();
  @override
  List<Object?> get props => [];
}

class AccessibilityIncreaseFontSize extends AccessibilityEvent {}

class AccessibilityDecreaseFontSize extends AccessibilityEvent {}
