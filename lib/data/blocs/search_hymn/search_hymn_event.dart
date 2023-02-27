part of 'search_hymn_bloc.dart';

@immutable
abstract class SearchHymnEvent {}

class GetHymnEvent extends SearchHymnEvent {
  final String searchText;

  GetHymnEvent({required this.searchText});
}
