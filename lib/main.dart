import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: const LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: ListView(
              padding:
                  const EdgeInsets.only(top: 150.0, left: 30.0, right: 30.0),
              children: [
                SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.network(
                        "https://www.neappoli.com/static/media/flutterImg.94b8139a.png")),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 120.0, right: 120.0, bottom: 20.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Enter Email",
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Required **"),
                    EmailValidator(errorText: "Wrong Email"),
                  ]),
                ),
                // ignore: prefer_const_constructors
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Enter Password",
                  ),
                  validator: MinLengthValidator(6,
                      errorText: "Should be At least 6 Digits Length"),
                ),
                // ignore: prefer_const_constructors
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                FlatButton(child: const Text("Submit"), onPressed: () {}),
              ],
            )),
      ),
    );
  }
}
