import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korastelhasabat/moduoles/calcolator_claint/calcolator_clint_screen.dart';
import 'package:korastelhasabat/moduoles/homescreen/homescreen.dart';
import 'package:korastelhasabat/shard/cubit/cubit.dart';
import 'package:korastelhasabat/shard/cubit/state.dart';

class ClientScreen extends StatelessWidget {
  var SearchControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Text(
            'اضافة عميل',
            style: TextStyle(
              fontSize: 13.2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: BlocConsumer<AppCubit, AppStet>(
        listener: (context, state) {},
        builder: (context, state) {
          var clint = AppCubit.get(context).myclimt;

          return ListView.separated(
            itemBuilder: (context, index) =>
                buildclintItem(clint[index], context),
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.lightBlue[200],
                ),
              );
            },
            itemCount: clint.length,
          );
        },
      ),
    );
  }
}

Widget buildclintItem(Map model, context) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CalcolatorScreeen()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
          color: Colors.lightBlue[200],
        ),
        child: Column(
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 IconButton(
                    onPressed: () {
                      AppCubit.get(context).DeleteData(id: model['id']);
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),

                  SizedBox(
                    height: h * 0.00,
                  ),


              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: CircleAvatar(
                    radius: 40,
                    child: Image(
                      height: h * 0.09,
                      width: w * 0.2,
                      image: AssetImage(
                          'assets/patient.png'
                      ),
                    ),
                  ),
                ),
              ],
            ),


            Text(
              ' ${model['name']}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: h * 0.00,
            ),
            Text(
              '${model['salary']} ج/م',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: h * 0.00,
            ),
            Text(
              ' ${model['product']}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
