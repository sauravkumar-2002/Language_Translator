import 'dart:async';
import 'package:floor/floor.dart';
import 'package:your_translator/db/dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'model.dart';
part 'database.g.dart';


// the generated code will be there

@Database(version: 1, entities: [Data_t])
abstract class UserDatabase extends FloorDatabase {
  DataDAO get dataDAO;
}
