import 'package:intl/intl.dart';

import 'database.dart';
import 'model.dart';

Future<List<int>> addUsers(UserDatabase db,String fromstring,String tostring) async {
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
  String ss=cdate+" \n"+tdata;
  Data_t firstUser = Data_t(from_string: fromstring,to_string: tostring,
      date:ss );

  print(firstUser.from_string);
  print(firstUser.to_string);
  // Data_t secondUser = Data_t(name: "john", age: 31, country: "United Kingdom");
  return await db.dataDAO.insertUser([firstUser]);
}
Future<List<Data_t>> retrieveUserr(UserDatabase db) async {
  return await db.dataDAO.retrieveData();
}
Future<Data_t?> deleteuser(UserDatabase db,int id) async {
  return await db.dataDAO.deleteUser(id);
}