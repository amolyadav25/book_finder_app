import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/book_entity.dart';
import '../../../domain/repository/book_repository.dart';
import 'event.dart';
import 'state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  BookBloc(this.bookRepository) : super(BookInitial()) {
    on<SearchBooks>(_fetchBooks);
  }

  Future<void> _fetchBooks(
    SearchBooks event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      List<BookEntity> books = await bookRepository.fetchBook(event.query);
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
}
