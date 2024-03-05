import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/buisinessLogic/fetchNote/note_cubit.dart';
import 'package:nota/model/noteModel.dart';
import 'package:nota/view/screens/noteEdite.dart';

import '../../../constants/appTextStyle.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return NoteEdit(
              note: note,
            );
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(note.title, style: TextAppStyle.noteTitle()),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  note.subTitle,
                  style: TextAppStyle.noteSubTitle(),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: InkWell(
                    onTap: () {
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Delete note',
                          desc: 'Are you sure to delete this note?',
                          btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        note.delete();
                        BlocProvider.of<NoteCubit>(context).featchnote();

                      },
                      )..show();
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 40,
                    )),
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0, bottom: 16),
              child: Text(note.date, style: TextAppStyle.notedate()),
            ),
          ],
        ),
      ),
    );
  }
}
