import 'package:flutter/material.dart';

import '../../../../core/local/database_helper.dart';
import '../../domain/entity/book_entity.dart';

class DetailPage extends StatefulWidget {
  final BookEntity book;
  const DetailPage({super.key, required this.book});

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _saveToFavorites() async {
    final messenger = ScaffoldMessenger.of(context);
    await DatabaseHelper.instance.insertBook(widget.book);
    messenger.showSnackBar(
      const SnackBar(content: Text('Book saved successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              RotationTransition(
                turns: _animationController.drive(Tween(begin: 0.0, end: 1.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.book.thumbnailUrl,
                    height: 200,
                    width: 150,
                    errorBuilder: (_, _, _) => Container(
                      width: 150,
                      height: 200,
                      color: Colors.grey,
                      child: const Icon(Icons.book, size: 50),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.book.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'By ${widget.book.author}',
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: _saveToFavorites,
                icon: Icon(Icons.save),
                label: const Text('Save to Favorite'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
