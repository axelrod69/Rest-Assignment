import 'package:flutter/material.dart';
import '../widget/list.dart';
import 'package:provider/provider.dart';
import '../provider/employee_provider.dart';

class MainScreen extends StatefulWidget {
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  var init = true;

  @override
  void didChangeDependencies() {
    if(init) {
      Provider.of<EmployeeProvider>(context).fetch();
    }
    init = false;
    super.didChangeDependencies();
  }

//  @override
//  void initState() {
//    Provider.of<EmployeeProvider>(context).fetch();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 75,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                        'Employee List',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        )
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 7,
                  child: IconButton(
                    icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('./add-screen');
                    },
                  ),
                )
              ],
            ),
            List()
          ],
        ),
      ),
    );
  }
}