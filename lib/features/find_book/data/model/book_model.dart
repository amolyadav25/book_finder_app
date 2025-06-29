import '../../domain/entity/book_entity.dart';

class BookModel {
  final String title;
  final String author;
  final String? coverId;
  BookModel({required this.title, required this.author, this.coverId});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? 'No Title',
      author: (json['author_name'] != null && json['author_name'].isNotEmpty)
          ? json['author_name'][0]
          : 'Unknown',
      coverId: json['cover_i']?.toString(),
    );
  }
  BookEntity toEntity() {
    return BookEntity(title: title, author: author, coverId: coverId);
  }
}
