import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nota/buisinessLogic/fetchNote/note_cubit.dart';
import 'package:nota/constants/strings.dart';

import '../../model/noteModel.dart';
import '../widgets/common/customAppbar.dart';
import '../widgets/noteForm/addNoteBottomSheet.dart';
import '../widgets/noteItem/noteListView.dart';

class NoteView extends StatefulWidget {
  static String routeName = 'note';

  const NoteView({Key? key}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).featchnote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        shape: const OvalBorder(),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 28,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            CustomAppbar(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              title: 'Notes',
              iconData: Icons.search,
            ),
            SizedBox(
              height: 15,
            ),
            NotesListView(),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<NoteModel> {
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
    // Implement your search logic using Hive here
    final notesBox = Hive.box<NoteModel>(hiveBoxName);

    // Query your Hive box and update the UI accordingly
    List<NoteModel> searchResults = notesBox.values
        .where((note) =>
        note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Update the UI with search results
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditNo,))
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
