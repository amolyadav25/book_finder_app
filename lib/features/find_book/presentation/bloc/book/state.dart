import 'package:equatable/equatable.dart';

import '../../../domain/entity/book_entity.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<BookEntity> books;
  const BookLoaded(this.books);

  @override
  List<Object?> get props => [];
}

class BookError extends BookState {
  final String error;
  const BookError(this.error);

  @override
  List<Object?> get props => [error];
}
