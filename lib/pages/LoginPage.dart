import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/My_Routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool onChange = false;
  final formValidationKey = GlobalKey<FormState>();
  navigateHomePage(BuildContext context) async {
    if (formValidationKey.currentState!.validate()) {
      setState(() {
        onChange = true;
      });
    }
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      onChange = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formValidationKey,
      child: Material(
          child: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Welcome $name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your Email",
                        labelText: "Email",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      } else if (value.length <= 7) {
                        return "Password must be atleast 7 words ";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        labelText: "Password",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Ink(
                    child: Material(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        splashColor: Colors.yellow,
                        onTap: () async {
                          navigateHomePage(context);
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: onChange ? 50 : 100,
                          height: 45,
                          alignment: Alignment.center,
                          child: onChange
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ]),
      )),
    );
  }
}
