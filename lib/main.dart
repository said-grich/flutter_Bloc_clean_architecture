import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quetos/app.dart';

import 'app_observer.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await di.init();
  BlocOverrides.runZoned(() => runApp(const QuotesApp()),
      blocObserver: AppBlocObserver());
}
