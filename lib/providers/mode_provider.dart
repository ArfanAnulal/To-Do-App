import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeNotifier extends Notifier<bool>{
  @override
  bool build() {
    return false;
    
  }

  void toggleMode(){
    state = !state;
  }
  
}
final modeNotifierProvider = NotifierProvider<ModeNotifier, bool>(
    ModeNotifier.new,
  );