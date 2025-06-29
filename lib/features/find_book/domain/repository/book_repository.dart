
import '../entity/book_entity.dart';

abstract class BookRepository {
  Future<List<BookEntity>> fetchBook(String query);
}