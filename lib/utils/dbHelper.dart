import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// 싱글톤
class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  static Map<String, Database> _databases = {};

  DBHelper._internal();

  Future<Database> _initDatabase(String dbName, Function onCreate) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, '$dbName.db');
    Database db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await onCreate(db, version);
    });
    _databases[dbName] = db;
    return db;
  }

  Future<void> initAllDatabase() async {
    await _initDatabase('search_history', _onCreateSearchHistoryDB);
  }

  Database? getDatabase(String dbName) {
    return _databases[dbName];
  }

  Future<void> closeDatabase(String dbName) async {
    if (_databases.containsKey(dbName)) {
      await _databases[dbName]!.close();
      _databases.remove(dbName);
    }
  }

  Future<void> closeAllDatabases() async {
    for (var db in _databases.values) {
      await db.close();
    }
    _databases.clear();
  }

  // 검색기록 DB 선언 & CRUD
  Future _onCreateSearchHistoryDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE search_history (
      id INTEGER PRIMARY KEY,
      word TEXT,
      dateTime TEXT
    )
  ''');
  }

  Future<int> insertOrUpdateSearchHistory(String word) async {
    Database? db = getDatabase('search_history');
    if (db != null) {
      final dateTime = DateTime.now().toString();

      // 기존 레코드가 있는지 확인
      List<Map<String, dynamic>> result = await db.query(
        'search_history',
        where: 'word = ?',
        whereArgs: [word],
      );

      if (result.isEmpty) {
        // 레코드가 없으면 삽입
        SearchHistory history = SearchHistory(word: word, dateTime: dateTime);
        return await db.insert('search_history', history.toMap());
      } else {
        // 레코드가 있으면 업데이트
        Map<String, dynamic> existingRecord = result.first;
        SearchHistory history = SearchHistory(
          id: existingRecord['id'],
          word: word,
          dateTime: dateTime,
        );
        return await db.update(
          'search_history',
          history.toMap(),
          where: 'id = ?',
          whereArgs: [history.id],
        );
      }
    }
    throw Exception('Database not initialized');
  }

  Future<List<SearchHistory>> fetchAllSearchHistory() async {
    Database? db = getDatabase('search_history');
    if (db != null) {
      List<Map<String, dynamic>> maps = await db.query('search_history');
      return maps.map((map) => SearchHistory.fromMap(map)).toList();
    }
    throw Exception('Database not initialized');
  }

  Future<int> updateSearchHistory(SearchHistory history) async {
    Database? db = getDatabase('search_history');
    if (db != null) {
      return await db.update('search_history', history.toMap(),
          where: 'id = ?', whereArgs: [history.id]);
    }
    throw Exception('Database not initialized');
  }

  Future<int> deleteSearchHistory(int id) async {
    Database? db = getDatabase('search_history');
    if (db != null) {
      return await db.delete('search_history', where: 'id = ?', whereArgs: [id]);
    }
    throw Exception('Database not initialized');
  }
}

// search_history DB 데이터모델
class SearchHistory {
  int? id;
  String word;
  String dateTime;

  SearchHistory({this.id, required this.word, required this.dateTime});

  // 데이터베이스에서 읽어올 때 사용
  factory SearchHistory.fromMap(Map<String, dynamic> json) => SearchHistory(
    id: json['id'],
    word: json['word'],
    dateTime: json['dateTime'],
  );

  // 데이터베이스에 저장할 때 사용
  Map<String, dynamic> toMap() => {
    'id': id,
    'word': word,
    'dateTime': dateTime,
  };
}
