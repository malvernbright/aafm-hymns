import 'dart:async';

import 'package:aafm_hymns/models/hymn_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/hymns_repository.dart';

part 'hymns_event.dart';
part 'hymns_state.dart';

class HymnsBloc extends Bloc<HymnsEvent, HymnsState> {
  final HymnsRepositoryImpl hymnsRepositoryImpl;
  final String searchText;
  HymnsBloc({required this.hymnsRepositoryImpl, required this.searchText})
      : super(HymnsInitial()) {
    on<LoadHymnsEvent>(_getHymns);
  }
  _getHymns(LoadHymnsEvent event, Emitter<HymnsState> emit) async {
    try {
      final hymns = await hymnsRepositoryImpl.fetchHymns(searchText);
      emit(HymnsLoadedState(hymns: hymns));
      print("ymns loaded state");
    } catch (e) {
      emit(HymnsErrorState(error: e.toString()));
    }
  }
}
