part of 'search_hymn_bloc.dart';

@immutable
abstract class SearchHymnState {
  const SearchHymnState();
}

class SearchHymnInitial extends SearchHymnState {
  const SearchHymnInitial();
}

class SearchHymnsLoading extends SearchHymnState {
  const SearchHymnsLoading();
}

class HymnSearchedState extends SearchHymnState {
  final List<HymnsModel> hymns;

  const HymnSearchedState({required this.hymns});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HymnSearchedState &&
        runtimeType == other.runtimeType &&
        hymns == other.hymns;
  }

  @override
  int get hashCode => hymns.hashCode;
}

class HymnSearchErrorState extends SearchHymnState {
  final String errorMessage;

  const HymnSearchErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
