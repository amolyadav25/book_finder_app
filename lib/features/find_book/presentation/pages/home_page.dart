import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/book/bloc.dart';
import '../bloc/book/event.dart';
import '../bloc/book/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeStatePage();
  }
}

class _HomeStatePage extends State {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Books')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hint: Text('Search'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: _textEditingController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _textEditingController.clear();
                          context.read<BookBloc>().add(SearchBooks(''));
                        },
                      )
                    : null,
              ),
              onChanged: (_) => setState(() {}),
              onSubmitted: (query) {
                if (query.trim().isNotEmpty) {
                  context.read<BookBloc>().add(SearchBooks(query));
                }
              },
            ),
            SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return _buildShimmerList();
                  } else if (state is BookLoaded) {
                    return RefreshIndicator(
                      onRefresh: _refreshResult,
                      child: ListView.builder(
                        itemCount: state.books.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.network(
                              state.books[index].thumbnailUrl,
                              width: 50,
                              height: 75,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) => Container(
                                width: 50,
                                height: 75,
                                color: Colors.grey.shade300,
                                child: Icon(Icons.book, color: Colors.white),
                              ),
                            ),
                            title: Text(state.books[index].title),
                            subtitle: Text(state.books[index].author),
                            onTap: () => context.push(
                              '/detail',
                              extra: state.books[index],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is BookError) {
                    return Center(child: Text(state.error));
                  } else {
                    return Center(
                      child: Text(
                        "Start Search",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshResult() async {
    if (_textEditingController.text.isEmpty) {
      context.read<BookBloc>().add(SearchBooks(_textEditingController.text));
      // await _fetchBooks(textEditingController.text);
    }
  }
}

Widget _buildShimmerList() {
  return ListView.builder(
    itemCount: 6,
    itemBuilder: (_, _) => Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        leading: Container(width: 50, height: 75, color: Colors.white),
        title: Container(
          width: double.infinity,
          height: 10,
          color: Colors.white,
        ),
        subtitle: Container(
          width: double.infinity,
          height: 10,
          color: Colors.white,
        ),
      ),
    ),
  );
}
