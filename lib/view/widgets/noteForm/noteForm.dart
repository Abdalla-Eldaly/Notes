import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nota/buisinessLogic/addnote/add_note_cubit.dart';
import 'package:nota/constants/colors.dart';
import 'package:nota/model/noteModel.dart';

import '../color/colorItem.dart';
import '../color/colorItemList.dart';
import '../common/customBotton.dart';
import '../common/customTextField.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description;
  int currentColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            onsave: (value) {
              title = value;
            },
            hintText: 'title',
            labelText: 'title',
            textInputType: TextInputType.text,
            maxline: 1,
          ),
          CustomTextField(
            onsave: (value) {
              description = value;
            },
            hintText: 'description',
            labelText: 'description',
            textInputType: TextInputType.multiline,
            maxline: 5,
          ),
          SizedBox(
            height: 44 * 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colorsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                  child: GestureDetector(
                      onTap: () {
                        print('index-----------+++++++++++++++');
                        currentColorIndex = index;
                        print(colorsList[index].value);
// BlocProvider.of<AddNoteCubit>(context).color = colorsList[index];
                        setState(() {});
                      },
                      child: ColorItem(
                        isActive: currentColorIndex == index,
                        color: colorsList[index],
                      )),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBotton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    var currentDate = DateTime.now();

                    var formattedCurrentDate =
                        DateFormat().add_yMEd().format(currentDate);

                    formKey.currentState!.save();

                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: description!,
                      date: formattedCurrentDate,
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).color =
                        colorsList[currentColorIndex];

                    BlocProvider.of<AddNoteCubit>(context).addnote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
