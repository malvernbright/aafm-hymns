import 'package:flutter/material.dart';

import '../../repositories/hymns_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourite_hymns_event.dart';
part 'favourite_hymns_state.dart';

class FavouriteHymnsBloc
    extends Bloc<FavouriteHymnsEvent, FavouriteHymnsState> {
  final HymnsRepositoryImpl hymnsRepositoryImpl;
  FavouriteHymnsBloc({required this.hymnsRepositoryImpl})
      : super(FavouriteHymnsInitial()) {
    on<AddFavouriteHymnsEvent>((event, emit) async {
      emit(FavouriteHymnsInitial());
      try {} catch (e) {
        emit(ErrorAddingHymnToFavourites(errorMessage: '$e'));
      }
    });
  }
}
