import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../models/hymn_model.dart';
import '../../repositories/hymns_repository.dart';

part 'search_hymn_event.dart';
part 'search_hymn_state.dart';

class SearchHymnBloc extends Bloc<SearchHymnEvent, SearchHymnState> {
  final HymnsRepositoryImpl hymnsRepositoryImpl;
  SearchHymnBloc(this.hymnsRepositoryImpl) : super(const SearchHymnInitial()) {
    on<GetHymnEvent>(_getHymns);
  }
  _getHymns(GetHymnEvent event, Emitter<SearchHymnState> emit) async {
    try {
      emit(const SearchHymnInitial());
      final hymns = await hymnsRepositoryImpl.fetchHymns(event.searchText);
      emit(HymnSearchedState(hymns: hymns));
    } catch (e) {
      emit(HymnSearchErrorState(errorMessage: '$e'));
    }
  }
}
