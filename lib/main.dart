import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nota/buisinessLogic/addnote/add_note_cubit.dart';
import 'package:nota/buisinessLogic/fetchNote/note_cubit.dart';
import 'package:nota/model/noteModel.dart';
import 'package:nota/simple_Bloc_Observer.dart';
import 'package:nota/view/screens/noteEdite.dart';
import 'package:nota/view/screens/noteView.dart';
import 'package:nota/view/screens/splashScreen.dart';

import 'constants/strings.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(hiveBoxName);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(

        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        title: 'ع النوته',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
      ),
    );
  }
}
