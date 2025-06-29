import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String title;
  final String author;
  final String? coverId;
  const BookEntity({required this.title, required this.author, this.coverId});
  @override
  List<Object?> get props => [title, author, coverId];
  String get thumbnailUrl => coverId != null
      ? 'https://covers.openlibrary.org/b/id/$coverId-M.jpg'
      : 'https://via.placeholder.com/50x75';
}
