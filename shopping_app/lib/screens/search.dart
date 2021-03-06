import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/categories/cars.dart';


class Search extends StatefulWidget {
  const Search({Key ? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.black,
            title: Center(child: Text("Search News")),
          )),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        primary: Colors.red[900],
                        padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                    child: Text("Search")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final news = [
    'ferrari',
    'neon'
    'mercedes benz'
  ];

  final recent = [
    'mercedes benz'
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, 'null');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest = query.isEmpty
        ? recent
        : news.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (contex, index) => ListTile(
        onTap: () {
          showResults(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Caritems()));
        },
        leading: Icon(Icons.search),
        title: RichText(
          text: TextSpan(
              text: suggest[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggest[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggest.length,
    );
  }
}
