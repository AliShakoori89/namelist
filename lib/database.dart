import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:namelist/Person.dart';


class DatabaseHelper{

  DatabaseHelper._();

  static const databaseName = 'MyDatabase.db';
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database _database;

  static final table = 'my_table';

  static final ColumnId = 'id';
  static final ColumnNationalCode = 'nationalcode';
  static final ColumnName = 'name';
  static final ColumnLastname = 'lastname';
  static final ColumnEmail = 'email';
  static final ColumnPhonenumber = 'phonenumber';

  Future<Database> get database async {
    if (_database == null) {
      return await _initDatabase();
    }
    return _database;
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE $table ( '
        ' $ColumnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,'
        ' $ColumnNationalCode TEXT NOT NULL ,'
        ' $ColumnName TEXT NOT NULL ,'
        ' $ColumnLastname TEXT NOT NULL ,'
        ' $ColumnPhonenumber TEXT ,'
        ' $ColumnEmail TEXT)');
        });
  }

//  Future _onCreate(Database db , int version) async {
//    await db.execute('CREATE TABLE $table ( '
//        ' $ColumnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,'
//        ' $ColumnName TEXT NOT NULL ,'
//        ' $ColumnLastname TEXT NOT NULL ,'
//        ' $ColumnPhonenumber TEXT ,'
//        ' $ColumnEmail TEXT)');
//  }

//  Future<int> insert (Map<String,dynamic> row) async{
//    Database db = await instance.database;
//    return await db.insert(table, row);
//  }

//  Future<List> getAllRecords() async{
//    var MyClient = await instance.database;
//    var result = await MyClient.rawQuery('SELECT * FROM my_table');
//    return result.toList();
//  }

//  Future<List<String>> queryAllRows() async {
//    Database db = await instance._initDatabase();
//    List<Map<String,dynamic>> s =  await db.query(table ,columns: [ ColumnName , ColumnLastname  , ColumnEmail]);
//    List<String> list = new List();
//    for(var x in s){
//      x.forEach((k,v)=>list.add(v));
//    }
//    return list;
//  }

  Future <List<Person>> retrieveTodos() async {
    var MyClient = await database;
    final List<Map<String , dynamic>> maps = await MyClient.query(Person.TABLENAME);

    return List.generate(maps.length, (i){
      return Person(
        id:maps[i]['id'],
        nationalcode:maps[i]['nationalcode'],
        name:maps[i]['name'],
        lastname:maps[i]['lastname'],
        email:maps[i]['email'],
        phonenumber:maps[i]['phonenumber'],
      );
    });
  }

//  Future<List<DatabaseHelper>> show() async {
//    var MyClient = await instance.database;
//    final List<Map<String , dynamic>> maps = await MyClient.query('my_table');
//    return List.generate(maps.length, (i){
//      return DatabaseHelper._privateConstructor(
//        id:maps[i]['_id'],
//        name:maps[i]['name'],
//        lastname:maps[i]['lastname'],
//        email:maps[i]['email'],
//        phonenumber:maps[i]['phonenumber'],
//      );
//    });
//  }

//  Future closedb() async{
//    var MyClient = await instance.database;
//    return MyClient.close();
//  }

  Future <Person> search(id) async{
    var MyClient = await instance.database;
    var result = await MyClient.rawQuery('SELECT * FROM my_table WHERE $ColumnNationalCode = $id');
    return new Person.MaptoObject(result.first);
  }

  Future<bool> insertTodo(Person person) async {
    var MyClient = await database;
    await MyClient.insert(Person.TABLENAME, person.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return true;
  }

  updateTodo(Person person) async {
    var MyClient = await database;
    print(person.id);
//    await MyClient.update(Person.TABLENAME, person.toMap(),
//        where: 'id = ?',
//        whereArgs: [person.id],
    await MyClient.update(Person.TABLENAME, person.toMap(),
        where: "id=?",
        whereArgs: [person.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//  Future<int> Delete(String id) async{
//    var MyClient = await instance.database;
//    var result = MyClient.delete('my_table' , where: "id=$id");
//    return result;
//  }

  deleteTodo(int id) async {
    print(id);
    var db = await database;
    db.delete(Person.TABLENAME, where: 'id = ?', whereArgs: [id]);
  }

//  Future<int> Update(Person person) async{
//    var MyClient = await instance.database;
//    var result = await MyClient.update('my_table', person.toMap(),where: "$ColumnId=?",whereArgs: [person.id]);
//    return result;
//  }


}


