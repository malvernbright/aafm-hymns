part of 'favourite_hymns_bloc.dart';

@immutable
abstract class FavouriteHymnsEvent extends Equatable {
  const FavouriteHymnsEvent();

  @override
  List<Object> get props => [];
}

class AddFavouriteHymnsEvent extends FavouriteHymnsEvent {}
