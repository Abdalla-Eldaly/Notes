import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nota/view/screens/noteView.dart';

import '../../../constants/strings.dart';
import '../../../model/noteModel.dart';

class CustomSearchDelegate extends SearchDelegate<NoteModel> {
  List<NoteModel> searchResults = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(query);
  }

  Widget _buildSearchResults(String query) {
    final notesBox = Hive.box<NoteModel>(hiveBoxName);

    searchResults = notesBox.values
        .where((note) =>
        note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(),));

          },
          child: Container(
            height: 75,
            child: Center(
              child: Card(
                elevation: 20,
                color: Colors.grey.withOpacity(.2),
                child: ListTile(
                  title: Text(searchResults[index].title),
                  // Add other UI elements as needed
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
