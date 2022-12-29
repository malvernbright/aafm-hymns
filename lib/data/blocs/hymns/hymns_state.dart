part of 'hymns_bloc.dart';

abstract class HymnsState extends Equatable {
  const HymnsState();
}

class HymnsInitial extends HymnsState {
  @override
  List<Object> get props => [];
}

class HymnsLoadedState extends HymnsState {
  final String hymnsChanged;
  final List<HymnsModel> hymns;

  const HymnsLoadedState({required this.hymnsChanged, required this.hymns});
  @override
  List<Object> get props => [hymns, hymnsChanged];
}

class HymnsSearchChangedState extends HymnsState {
  const HymnsSearchChangedState();
  @override
  List<Object> get props => [];
}

class HymnsErrorState extends HymnsState {
  final String error;

  const HymnsErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
