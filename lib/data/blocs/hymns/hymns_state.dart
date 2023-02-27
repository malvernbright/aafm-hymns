part of 'hymns_bloc.dart';

abstract class HymnsState extends Equatable {
  const HymnsState();
}

class HymnsInitial extends HymnsState {
  @override
  List<Object> get props => [];
}

class HymnsLoadedState extends HymnsState {
  final List<HymnsModel> hymns;

  const HymnsLoadedState({required this.hymns});
  @override
  List<Object> get props => [hymns];
}

class HymnAddToFavoriteState extends HymnsState {
  final String title;
  final String hymn;
  final String id;

  const HymnAddToFavoriteState(
      {required this.title, required this.hymn, required this.id});
  @override
  List<Object> get props => [title, hymn, id];
}

class HymnsErrorState extends HymnsState {
  final String error;

  const HymnsErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
