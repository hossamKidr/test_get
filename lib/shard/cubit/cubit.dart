import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korastelhasabat/moduoles/homescreen/homescreen.dart';
import 'package:korastelhasabat/shard/cubit/state.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppCubit extends Cubit<AppStet> {
  AppCubit() : super(AppInitialState()) {}

  late Database db;

  static AppCubit get(context) => BlocProvider.of(context);
  List<Map> myclimtSearch = [];
  List<Map> myclimt = [];

  CreateDataBase() {
    openDatabase(
      'Clint.db',
      version: 1,
      onCreate: (db, version) {
        print('DataBase is Created');

        db
            .execute(
                'CREATE TABLE Clint (id INTEGER PRIMARY KEY, name TEXT, mobil TEXT, salary TEXT, product TEXT)')
            .then((value) {
          print('Table is created');
        }).catchError((error) {
          print('error is ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDataBase(database).then((value) {
          myclimt = value;
          print(myclimt);
          emit(AppgetDataFromDataBase());
        });
        print('DataBase is opening');
      },
    ).then((value) {
      db = value;
      emit(AppCreateDataBase());
    });
  }

  inseartDataBase(
      {required String name,
      required String mobil,
      required String salary,
      required String product}) async {
    return await db.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO Clint (name, mobil, salary, product) VALUES("$name", "$mobil", "$salary", "$product")',
      )
          .then((value) {
        print('$value  inseart in database');
        emit(AppinsaertDataBase());

        getDataFromDataBase(db).then((value) {
          myclimt = value;
          print(myclimt);

          emit(AppgetDataFromDataBase());
        });
      }).catchError((error) {
        print('error is ${error.toString()}');
      });
    });
  }

  Future<List<Map>> getDataFromDataBase(database) async {
    return await database.rawQuery('SELECT * FROM Clint');
  }

  DeleteData({required id}) async {
    await db.rawDelete('DELETE FROM Clint WHERE id = ?', [id]).then((value) {
      print(value);
      emit(AppdeleteDataFromDataBase());
      getDataFromDataBase(db);
    });
  }

  void SearsData(value) {
    myclimt = myclimt.where((element) => element.containsValue(value)).toList();
    emit(Search());
  }
}

