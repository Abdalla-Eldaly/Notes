import 'package:flutter/material.dart';

import '../widgets/addNoteBottomSheet.dart';
import '../widgets/customAppbar.dart';
import '../widgets/noteListView.dart';

class NoteView extends StatelessWidget {
  static String routeName = 'note';
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        shape: OvalBorder(),
        onPressed: () {
           showModalBottomSheet(

             context: context, builder: (context) {
            return AddNoteBottomSheet();
          },);
        },
        child: Container(
            child: Icon(
          Icons.add,
          color: Colors.black,
          size: 28,
        )),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            CustomAppbar(title: 'Notes', iconData: Icons.search,),
            SizedBox(
              height: 15,
            ),
            NotesListView()
          ],
        ),
      ),
    );
  }
}
