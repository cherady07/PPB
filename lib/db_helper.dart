import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  factory DbHelper() => _instance;

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'contact.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Membuat tabel bernama 'contacts' sesuai permintaan soal
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        telepon TEXT
      )
    ''');
  }

  // Fungsi mengambil semua data kontak
  Future<List<Map<String, dynamic>>> getContacts() async {
    Database db = await database;
    return await db.query('contacts', orderBy: 'id DESC');
  }

  // Fungsi menambah kontak baru (Insert)
  Future<int> insertContact(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('contacts', row);
  }

  // Fungsi menghapus data kontak
  Future<int> deleteContact(int id) async {
    Database db = await database;
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }
}
