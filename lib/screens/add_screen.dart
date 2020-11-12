import 'package:flutter/material.dart';
import '../model/file.dart';
import 'package:provider/provider.dart';
import '../provider/employee_provider.dart';

class AddScreen extends StatefulWidget {
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
//    final name = FocusNode();
    final age = FocusNode();
    final salary = FocusNode();
    final form = GlobalKey<FormState>();
    var file = File(
      id: null,
      name: '',
      age: 0,
      salary: 0
    );

    var isLoading = false;

    saved() {
      form.currentState.save();
      setState(() {
        isLoading = true;
      });
      Provider.of<EmployeeProvider>(context, listen: false).addProduct(file).then((value) {
        Navigator.of(context).pop();
        setState(() {
          isLoading = false;
        });
      });
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Record'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(age);
                },
                onSaved: (value) {
                  file = File(
                    id: file.id,
                    name: value,
                    age: file.age,
                    salary: file.salary
                  );
                },
              ),
              TextFormField(
                focusNode: age,
                decoration: InputDecoration(labelText: 'Age'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(salary);
                },
                onSaved: (value) {
                  file = File(
                    id: file.id,
                    name: file.name,
                    age: double.parse(value),
                    salary: file.salary
                  );
                },
              ),
              TextFormField(
                focusNode: salary,
                decoration: InputDecoration(labelText: 'Salary'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) {
                  isLoading ? Center(
                    child: CircularProgressIndicator(),
                  ) : saved();
                },
                onSaved: (value) {
                  file = File(
                    id: file.id,
                    name: file.name,
                    age: file.age,
                    salary: double.parse(value)
                  );
                },
              ),
              SizedBox(height: 10),
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  isLoading ? Center(
                    child: CircularProgressIndicator(),
                  ) : saved();
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}