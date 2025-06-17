import 'package:sembast/sembast.dart';

import 'initialize_database.dart';

class DatabaseService {
  static const String tree_folder = 'family_tree';

  final _treeFolder = intMapStoreFactory.store(tree_folder);

  Future<Database> get _db async => await AppDatabase.instance.database;

  addDataToDb(Map<String, dynamic> data) async {
    await _treeFolder.delete(await _db);
    await _treeFolder.add(await _db, data);
    // await _treeFolder.add(
    //     await _db, {"Name": "a", "date": DateTime.now().toIso8601String()});
    // print("Data Added Successfully");
  }

  getRecords() async {
    var records = await _treeFolder.find(await _db);
    print("Records Length ${records.length}");
  }
}
