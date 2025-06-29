
import '../entity/book_entity.dart';
import '../repository/book_repository.dart';

class FetchUserUseCase {
  final BookRepository bookRepository;
  FetchUserUseCase(this.bookRepository);
  Future<List<BookEntity>> search(String query) async {
    return  bookRepository.fetchBook(query);
  }
}