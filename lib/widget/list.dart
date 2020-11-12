import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/employee_provider.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeeProvider>(context);
    // TODO: implement build
    return ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (ctx, index) => ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red
              ),
              child: Center(
                child: Text(
                    provider.file[index].id,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
            ),
            title: Container(
              height: 90,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    Text(
                        'NAME' + ' ' + provider.file[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )
                    ),
                    Text(
                      'AGE' + ' ' + provider.file[index].age.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      'SALARY' + ' ' + provider.file[index].salary.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.red
              ),
              onPressed: () {
                provider.deleteProduct(provider.file[index].id);
              },
            ),
          ),
          itemCount: provider.file.length
      );
  }
}