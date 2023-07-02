import 'package:floor/floor.dart';


import 'model.dart';

@dao
abstract class DataDAO {
  @insert
  Future<List<int>> insertUser(List<Data_t> data);

  @Query('SELECT * FROM Data_t')
  Future<List<Data_t>> retrieveData();

  @Query('DELETE FROM Data_t WHERE id = :id')
  Future<Data_t?> deleteUser(int id);
}