import 'package:book_finder_app/features/find_book/data/data_sources/book_remote_data_source.dart';
import 'package:book_finder_app/features/find_book/data/repository/book_repository_impl.dart';
import 'package:book_finder_app/features/find_book/domain/entity/book_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockBookRemoteDataSource extends Mock implements BookRemoteDataSource {}

void main() {
  late BookRepositoryImpl bookRepositoryImpl;
  late MockBookRemoteDataSource mockBookRemoteDataSource;
  setUp(() {
    mockBookRemoteDataSource = MockBookRemoteDataSource();
    bookRepositoryImpl = BookRepositoryImpl(mockBookRemoteDataSource);
  });
  group('BookRepositoryImpl', () {
    test(
      'return List<BookEntity> when remote Data Source responds correctly',
      () async {
        const query = 'as';
        final mockResponse = {
          'docs': [
            {'title': 'New App As', 'author_name': ['Amal'], 'cover_i': 1234},
            {'title': 'As App As', 'author_name': ['AmalY'], 'cover_i': 7634},
          ],
        };
        when(()=>mockBookRemoteDataSource.searchUser(query)).thenAnswer((_) async => mockResponse);

        final result = await bookRepositoryImpl.fetchBook(query);

        expect(result,isA<List<BookEntity>>());
        expect(result.length,2);
        expect(result[0].title,'New App As');
        expect(result[0].author,'Amal');
        expect(result[0].coverId, '1234');
        verify(()=>mockBookRemoteDataSource.searchUser(query)).called(1);
      },
    );
  });
}
