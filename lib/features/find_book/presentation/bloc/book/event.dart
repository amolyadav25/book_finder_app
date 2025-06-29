abstract class BookEvent {
  const BookEvent();
}

class InitEvent extends BookEvent {}

class SearchBooks extends BookEvent {
  final String query;
  const SearchBooks(this.query);

  List<Object?> get props => [query];
}