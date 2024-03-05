import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/buisinessLogic/addNote/add_note_cubit.dart';

import '../../../constants/colors.dart';
import 'colorItem.dart';

class ColorItemList extends StatefulWidget {
  const ColorItemList({super.key,  this.currentColorIndex = 0});
  final int currentColorIndex ;

  @override
  State<ColorItemList> createState() => _ColorItemListState();
}

class _ColorItemListState extends State<ColorItemList> {
  int currentColorIndex = 0;
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
                  print('index-----------+++++++++++++++');
                  currentColorIndex = index;
                  print(colorsList[index].value);
                  setState(() {});
                },
                child: ColorItem(
                  isActive: currentColorIndex == index, color: colorsList[index],
                )),
          );
        },
      ),
    );
  }
}


