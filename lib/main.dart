import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/theme/themes.dart';



  
void main() {
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

