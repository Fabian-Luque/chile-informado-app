import 'package:flutter/material.dart';

import 'package:formvalidation/src/blocs/provider.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';
import 'package:formvalidation/src/pages/producto_page.dart';
import 'package:formvalidation/src/pages/registro_page.dart';
import 'package:formvalidation/src/user-prefs/user-prefs.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPrefs();
  await prefs.initPrefs();
  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    final prefs = new UserPrefs();

    print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chile-informado',
        initialRoute: 'login',
        routes: {
          'login'     : ( BuildContext context ) => LoginPage(),
          'registro'  : ( BuildContext context ) => RegistroPage(),
          'home'      : ( BuildContext context ) => HomePage(),
          'producto'  : ( BuildContext context ) => ProductPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.blueAccent
        ),
      ),
    );
  }
}