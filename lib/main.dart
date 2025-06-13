import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/providers/mode_provider.dart';
import 'package:todo_app/theme/themes.dart';


class SembastDatabase {
  static final SembastDatabase _singleton = SembastDatabase._(); //masterkey to access DB
  static SembastDatabase get instance => _singleton; //since singleton is private, it can only be accessed through instance

  late Database _database; 
  Database get database { //encapsulation to make the main _database safe
    return _database;     //code will work if you make _database as database and remove this function
  }

  SembastDatabase._();  //private constructor 

  Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();//gets path to store DB
    await appDir.create(recursive: true);
    final dbPath = join(appDir.path, 'todos.db');//adds the name of our DB(todos.db) to the end of the appDir path
    _database = await databaseFactoryIo.openDatabase(dbPath);//opens DB   
  }
}
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SembastDatabase.instance.init();
  runApp(ProviderScope(child: const MyApp()) );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final modes = ref.watch(modeNotifierProvider);
    return MaterialApp(
      title: 'To-Do List',
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: modes? ThemeMode.dark: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

