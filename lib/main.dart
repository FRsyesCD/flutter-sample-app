



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/data_provider.dart';
import 'screens/generator_screen.dart';
import 'screens/my_home_screen.dart';
import 'screens/test_screen.dart';
import 'utils/theme.dart';

void main() => runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>MyProvider(),)
  ],
  child: MyApp(),
  )
  
    
);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
      title: 'Does',
      theme: themeData(),
      initialRoute: '/',
      routes: {
        '/':(context)=>MyHomePage(title:'Does'),
        '/gen_screen':(context)=>MyGeneratorScreen(),
        '/test_screen':(context)=>MyTestScreen(),
      },
    );
  }
}


