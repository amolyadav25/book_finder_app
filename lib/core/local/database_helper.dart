import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../features/find_book/domain/entity/book_entity.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'books.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''Create TABLE books (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,author TEXT,coverId TEXT)''',
        );
      },
    );
  }

  Future<void> insertBook(BookEntity book) async {
    final db = await database;
    await db.insert('books', {
      'title': book.title,
      'author': book.author,
      'coverId': book.coverId,
    });
  }

  Future<List<BookEntity>> getSavedBook() async {
    final db = await database;
    final maps = await db.query('books');
    return maps
        .map(
          (map) => BookEntity(
            title: map['title'] as String,
            author: map['author'] as String,
          ),
        )
        .toList();
  }
}
