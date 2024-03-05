import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nota/buisinessLogic/fetchNote/note_cubit.dart';
import 'package:nota/constants/strings.dart';

import '../../model/noteModel.dart';
import '../widgets/common/customAppbar.dart';
import '../widgets/noteForm/addNoteBottomSheet.dart';
import '../widgets/noteItem/noteListView.dart';
import '../widgets/search/customSearchDelegate.dart';

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

