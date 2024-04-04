import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import '../domain/Song.dart';

class SongService {

  Future<Database> initializedDB() async {
    if(kIsWeb)
    {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfiWeb;
    }
    if(Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    } else {
      print('OS: ${Platform.operatingSystem}');
    }
    String databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "songs.sqlite");
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(url.join("Database", "songs.sqlite"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    return await openDatabase(path, readOnly: true);
  }

  Future<List<Song>> findAll() async {
    Database database = await initializedDB();
    var response = await database.query("songs");
    List<Song> list = response.map((c) => Song.fromMap(c)).toList();
    return list;
  }
}