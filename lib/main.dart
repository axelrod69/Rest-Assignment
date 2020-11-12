import 'package:flutter/material.dart';
import './screens/add_screen.dart';
import './screens/main_screen.dart';
import 'package:provider/provider.dart';
import './provider/employee_provider.dart';

void main() {
  runApp(RestApi());
}

class RestApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => EmployeeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red
        ),
        initialRoute: './',
        routes: {
          './' : (ctx) => MainScreen(),
          './add-screen' : (ctx) => AddScreen()
        },
      ),
    );
  }
}