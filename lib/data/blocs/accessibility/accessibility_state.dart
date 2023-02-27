part of 'accessibility_bloc.dart';

@immutable
abstract class AccessibilityState extends Equatable {
  const AccessibilityState();

  @override
  List<Object> get props => [];
}

class AccessibilityInitial extends AccessibilityState {}
