import 'package:flutter/material.dart';

import '../widgets/customAppbar.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 60,),
            CustomAppbar()
          ],
        ),
      ),
    );
  }
}


