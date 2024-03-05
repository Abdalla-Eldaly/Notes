import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nota/constants/strings.dart';

import '../../../model/noteModel.dart';

class CustomSearchDelegate extends SearchDelegate {
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
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search logic using Hive here
    final notesBox = Hive.box<NoteModel>(hiveBoxName);

    // Query your Hive box and update the UI accordingly
    List<NoteModel> searchResults = notesBox.values
        .where((note) =>
        note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Horizontal ListView to display search results
    return Container(
      height: 600.0,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return Container(
            height: 400,
            color: Colors.redAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(

                child: ListTile(
                  title: Text(searchResults[index].title),
                  // Add other UI elements as needed
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can implement suggestions if needed
    return Container();
  }
}
