import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korastelhasabat/moduoles/homescreen/client/clientscreen.dart';
import 'package:korastelhasabat/shard/cubit/cubit.dart';
import 'package:korastelhasabat/shard/cubit/state.dart';

import '../homescreen/homescreen.dart';

class SblashScreen extends StatefulWidget {
  const SblashScreen({Key? key}) : super(key: key);

  @override
  State<SblashScreen> createState() => _SblashScreenState();
}

class _SblashScreenState extends State<SblashScreen> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ClientScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(

      child: Scaffold(

        body: Center(

          child: Padding(
            padding: const EdgeInsets.all(10.0),

            child: Center(
              child: Column(

                children: [
                  SizedBox(
                    height: h * 0.1,
                  ),

                  SizedBox(
                    height: h * 0.05,
                  ),
                  Image(
                    height: h * 0.7,
                    width: w * 0.9,
                    image: AssetImage('assets/notebooks.png'),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Text(
                    'اقساط',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[300],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
