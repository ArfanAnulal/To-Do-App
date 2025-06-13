

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';
import 'package:todo_app/main.dart';

class ModeNotifier extends Notifier<bool>{
  final _storeMode = StoreRef<String, bool>('settings'); //creates an area in the database to store modes
  Database get _db => SembastDatabase.instance.database; //gets the database instance
  @override
  bool build() {
    return false;
    
  }

  Future<void> loadMode() async{
    final savedValue = await _storeMode.record('isDarkMode').get(_db);
    state = savedValue ?? false;
  }

  Future<void> toggleMode() async{
    state = !state;
    await _storeMode.record('isDarkMode').put(_db, state);
  }
  
}
final modeNotifierProvider = NotifierProvider<ModeNotifier, bool>(
    ModeNotifier.new,
  );