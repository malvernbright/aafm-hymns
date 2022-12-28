part of 'hymns_bloc.dart';

abstract class HymnsEvent extends Equatable {
  const HymnsEvent();

  @override
  List<Object> get props => [];
}

class LoadHymnsEvent extends HymnsEvent {}
