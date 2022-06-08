import 'package:astro_talk/injector.dart';
import 'package:astro_talk/src/features/astro_talks/presentation/state_manager/home_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/core/theme_data.dart';
import 'src/features/astro_talks/presentation/views/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<HomeManager>(create:(_)=>injector())
      ],
      child: const AstroTalksHomePage()),
    );
  }
}

