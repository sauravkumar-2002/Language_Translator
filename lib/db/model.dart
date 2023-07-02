import 'package:floor/floor.dart';
@entity
class Data_t {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String from_string;
  final String to_string;
  final String date;
  final String? from_to;

  Data_t({ this.id,
    required this.from_string,
    required this.to_string,
    required this.date,
    this.from_to});
}

