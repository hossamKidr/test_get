import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korastelhasabat/moduoles/homescreen/client/clientscreen.dart';
import 'package:korastelhasabat/shard/cubit/cubit.dart';
import 'package:korastelhasabat/shard/cubit/state.dart';

class HomeScreen extends StatelessWidget {
  var NameController = TextEditingController();
  var MobilController = TextEditingController();
  var SalaryController = TextEditingController();
  var ProductController = TextEditingController();
  var FormKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppStet>(
      listener: (context, state) {
        if(state is AppinsaertDataBase){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(

          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: FormKye,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h * 0.05,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الاسم مطلوب';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text('الاسم'),
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Colors.lightBlue,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ))),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'التليفون مطلوب';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'التليفون',
                          prefixIcon: Icon(
                            Icons.phone_android,
                          ),
                          prefixIconColor: Colors.lightBlue,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ))),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'السعر الاجمالي مطلوب';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'السعر الاجمالي',
                          prefixIcon: Icon(Icons.monetization_on_sharp),
                          prefixIconColor: Colors.lightBlue,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ))),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الصنف مطلوب';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text('الصنف'),
                          prefixIcon: Icon(Icons.question_mark),
                          prefixIconColor: Colors.lightBlue,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ))),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    MaterialButton(
                        height: h * 0.06,
                        minWidth: w * 0.9,
                        color: Colors.lightBlue[200],
                        splashColor: Colors.white,
                        textColor: Colors.white,
                        child: Text(
                          'اضافة عميل',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          if (FormKye.currentState!.validate()) {
                            
                           AppCubit.get(context).inseartDataBase(
                             name: NameController.text,
                             mobil: MobilController.text,
                             salary: SalaryController.text,
                             product: ProductController.text
                           );


                          }
                        }),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Text(
                      ' اضافة عميل جديد ?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightBlue[200],
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: h * 0.05,
                    ),
                    Column(

                      children: [
                        IconButton(

                            onPressed: (){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ClientScreen()));
                            },

                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                              color: Colors.lightBlue[200],
                            ),
                        )
                      ],
                    ),
                  ],

                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
