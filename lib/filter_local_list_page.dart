import 'package:connectcollege/content_expanded.dart';

import './book_data.dart';
import './main.dart';
import './video_content_class.dart';
import './search_widget.dart';
import 'package:flutter/material.dart';

class FilterLocalListPage extends StatefulWidget {

  final List selectedColleges;
  const FilterLocalListPage(this.selectedColleges);

  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<VideoContent> books;
  String query = '';

  @override
  void initState() {
    super.initState();
    books = allVideo;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Institutes'),
      centerTitle: true,
    ),
    body: Column(
      children: <Widget>[
        buildSearch(),
        Expanded(
          child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];

              if(widget.selectedColleges.contains(book.instituteName)) {
                return buildBook(book);
              }
              else if(books.length==0){
                return buildBook(book);
              }
              else return buildNoBook();
            },
          ),
        ),
      ],
    ),
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Title or Author Name',
    onChanged: searchBook,
  );

  Widget buildBook(VideoContent book) => ListTile(
    leading: Image.network(
      book.urlImage,
      fit: BoxFit.cover,
      width: 50,
      height: 50,
    ),
    title: Text(book.title),
    subtitle: Text(book.instituteName),
    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VideoPlayerScreen(book))),
  );

  Widget buildNoBook()=>Container();

  void searchBook(String query) {
    final books = allVideo.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.instituteName.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}

