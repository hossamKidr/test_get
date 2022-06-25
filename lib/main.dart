import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korastelhasabat/moduoles/calcolator_claint/calcolator_clint_screen.dart';
import 'package:korastelhasabat/moduoles/homescreen/client/clientscreen.dart';
import 'package:korastelhasabat/moduoles/homescreen/homescreen.dart';
import 'package:korastelhasabat/moduoles/sblasscreen/sblashscreen.dart';
import 'package:korastelhasabat/shard/cubit/cubit.dart';
import 'package:korastelhasabat/shard/cubit/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..CreateDataBase(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: SblashScreen(),
      ),
    );



  }
}
