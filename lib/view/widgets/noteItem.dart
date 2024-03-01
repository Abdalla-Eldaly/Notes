import 'package:flutter/material.dart';

import '../../constants/appTextStyle.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.orange
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 10,),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Flutter tips',style: TextAppStyle.noteTitle()),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('start your career with abdalla eldaly',style: TextAppStyle.noteSubTitle(),),
            ),
            trailing: IconButton(onPressed: (){

            },icon: Icon(Icons.delete,size: 35,),color: Colors.black,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0,bottom: 16),
            child: Text('mar 2024/3/1',style: TextAppStyle.notedate()),
          ),
        ],
      ),
    );
  }
}
