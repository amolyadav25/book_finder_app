import 'package:book_finder_app/features/find_book/domain/entity/book_entity.dart';

import '../../domain/repository/book_repository.dart';
import '../data_sources/book_remote_data_source.dart';
import '../model/book_model.dart';

class BookRepositoryImpl extends BookRepository {
  final BookRemoteDataSource _bookRemoteDataSource;

  BookRepositoryImpl(this._bookRemoteDataSource);

  @override
  Future<List<BookEntity>> fetchBook(String query) async {
    final apiResponse = await _bookRemoteDataSource.searchUser(query);
    final List docs = apiResponse['docs'] ?? [];
    return docs
        .map((json) => BookModel.fromJson(json).toEntity())
        .toList();
  }
}
