import 'package:flutter/material.dart';
import 'package:nota/model/noteModel.dart';

import '../../../constants/colors.dart';
import '../color/colorItem.dart';

class EditeNoteColorList extends StatefulWidget {
  const EditeNoteColorList({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditeNoteColorList> createState() => _EditeNoteColorListState();
}

class _EditeNoteColorListState extends State<EditeNoteColorList> {
  late int currentColorIndex ;

  @override
  void initState() {
currentColorIndex = colorsList.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
            child: GestureDetector(
                onTap: () {
                  print(index);
                  currentColorIndex = index;
                  widget.noteModel.color = colorsList[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  isActive: currentColorIndex == index,
                  color: colorsList[index],
                )),
          );
        },
      ),
    );
  }
}
