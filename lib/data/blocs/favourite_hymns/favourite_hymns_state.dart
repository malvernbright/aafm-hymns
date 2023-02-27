part of 'favourite_hymns_bloc.dart';

abstract class FavouriteHymnsState extends Equatable {
  const FavouriteHymnsState();

  @override
  List<Object> get props => [];
}

class FavouriteHymnsInitial extends FavouriteHymnsState {}

class AddFavouriteHymnState extends FavouriteHymnsState {
  final String title, hymn, id;

  const AddFavouriteHymnState(
      {required this.title, required this.hymn, required this.id});
  @override
  List<Object> get props => [title, hymn, id];
}

class ErrorAddingHymnToFavourites extends FavouriteHymnsState {
  final String errorMessage;

  const ErrorAddingHymnToFavourites({required this.errorMessage});
}
