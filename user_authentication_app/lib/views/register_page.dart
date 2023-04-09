import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication_app/utils/ultis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_authentication_app/views/home_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final firstNameInputController = TextEditingController();
  final lastNameInputController = TextEditingController();
  final emailInputController = TextEditingController();
  final pwdInputController = TextEditingController();
  final confirmPwdInputController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  String? emailValidator(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String? pwdValidator(String? value) {
    if (value!.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Container(
        padding: edgeInsectAll(20),
        child: SingleChildScrollView(
          child: Form(
            key: _registerFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter Your First Name'),
                  controller: firstNameInputController,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.length < 3) {
                      return "please enter a valid name";
                    }
                    // return value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Last Name', hintText: 'Enter Your Last Name'),
                  controller: lastNameInputController,
                  validator: (value) {
                    if (value!.length < 3) {
                      return "please enter a valid name";
                    }
                    // return value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Email', hintText: 'Enter Your Email'),
                  controller: emailInputController,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Password', hintText: 'Enter Your Password'),
                  controller: pwdInputController,
                  obscureText: true,
                  validator: pwdValidator,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: "Re-enter Your Password"),
                  controller: confirmPwdInputController,
                  obscureText: true,
                  validator: pwdValidator,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        if (pwdInputController.text ==
                            confirmPwdInputController.text) {
                          auth
                              .createUserWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                              .then((currentUser) => FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(currentUser.user?.uid)
                                  .set({
                                    "uid": currentUser.user?.uid,
                                    "fname": firstNameInputController.text,
                                    "surname": lastNameInputController.text,
                                    "email": emailInputController.text
                                  })
                                  .then((result) => {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                      title:
                                                          "${firstNameInputController.text}'s Task",
                                                      uid:
                                                          currentUser.user?.uid,
                                                    )),
                                            (_) => false),
                                        firstNameInputController.clear(),
                                        lastNameInputController.clear(),
                                        emailInputController.clear(),
                                        pwdInputController.clear()
                                      })
                                  .catchError((err) => print(err)))
                              .catchError((err) => print(err));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("The passwords do not match"),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      }
                    },
                    child: const Text("Register")),
                Text("Already have an account?"),
                ElevatedButton(
                  child: Text("Login here!"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
