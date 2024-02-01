import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studentdb_assignment/db/database_helper.dart';
import 'package:studentdb_assignment/models/student.dart';
import 'package:studentdb_assignment/screens/student_list_screen.dart';
import 'package:studentdb_assignment/utility/data_store.dart';
// import 'package:studentdb_assignment/widgets/beautiful_card.dart';


class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name, email, mobile;

  String _selectedCourse = courses[0];
  String _selectedUni = universities[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Add Student', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: const Icon(Icons.person, color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),


                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }

                  name = text;
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }
                  final bool emailValid =
                  RegExp(r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
                      .hasMatch(text);
                  if (emailValid == false) {
                    return 'Please Enter Valid Email E.g ali@gmail.com';
                  }
                  email = text;
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                maxLength: 11,

                decoration: const InputDecoration(
                  hintText: 'Phone',
                  border: OutlineInputBorder(),

                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please provide value';
                  }

                  mobile = text;
                  return null;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              DropdownButtonFormField(
                value: _selectedCourse,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _selectedCourse = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _selectedCourse = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "can't empty";
                  } else {
                    return null;
                  }
                },
                items: courses.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 18,),
              DropdownButtonFormField(
                value: _selectedUni,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _selectedUni = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _selectedUni = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "can't empty";
                  } else {
                    return null;
                  }
                },
                items: universities.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // Save student
                      Student student = Student(
                        name: name,
                        email: email,
                        mobile: mobile,
                        course: _selectedCourse,
                        uni: _selectedUni,
                      );

                      int result = await DatabaseHelper.instance.saveStudent(student);

                      if( result > 0 ){
                        //print(result);
                        Fluttertoast.showToast(msg: 'Record Saved', backgroundColor: Colors.green);

                        formKey.currentState!.reset();
                      }else{
                        //print(result);
                        Fluttertoast.showToast(msg: 'Failed', backgroundColor: Colors.red);

                      }
                    }
                  },
                  child: const Text('Save')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const StudentListScreen();
                    }));
                  },
                  child: const Text('View All')),
            ],
          ),
        ),
      ),
    );
  }
}
