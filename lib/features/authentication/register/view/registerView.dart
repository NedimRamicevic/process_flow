import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/workerProvider.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/loading.dart';
import '../service/registerService.dart';

class Register extends StatefulWidget {
  const Register({
    Key? key,
    required this.setifSignIn,
  }) : super(key: key);

  final Function setifSignIn;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterAuthService _auth = RegisterAuthService();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  String name = "", lastname = "", email = "", password = "", error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: RegisterAppBar(),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              color: Colors.amberAccent[400],
              child: Form(
                  key: _registerKey,
                  child: Column(
                    children: <Widget>[
                      const CustomSizedWidget(
                        size: 20,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "Name",
                        ),
                        validator: valideteName,
                        onChanged: onNameChanged,
                      ),
                      const CustomSizedWidget(
                        size: 20,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "Last Name",
                        ),
                        validator: valideteName,
                        onChanged: onLastNameChanged,
                      ),
                      const CustomSizedWidget(
                        size: 20,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "E-mail",
                        ),
                        validator: validateEmail,
                        onChanged: onEmailChange,
                      ),
                      const CustomSizedWidget(
                        size: 20,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "Password",
                        ),
                        validator: validatePassword,
                        obscureText: true,
                        onChanged: onPasswordChange,
                      ),
                      const CustomSizedWidget(
                        size: 10,
                      ),
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const CustomSizedWidget(
                        size: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        child: const Text("Register"),
                        onPressed: onRegisterButtonPressed,
                      )
                    ],
                  )),
            ),
          );
  }

  void onRegisterButtonPressed() async {
    if (_registerKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.createUserWithEmailAndPassword(
          email, password, name, lastname);
      if (result == null) {
        setState(() {
          loading = false;
          error = "enter a valid email";
        });
      } else {
        setState(() {
          Provider.of<UserProvider>(context, listen: false).getWorker(result);

          loading = false;
        });
      }
    }
  }

  void onPasswordChange(val) {
    setState(() {
      password = val;
    });
  }

  void onNameChanged(val) {
    setState(() {
      name = val;
    });
  }

  void onLastNameChanged(val) {
    setState(() {
      lastname = val;
    });
  }

  String? validatePassword(value) =>
      value!.length < 6 ? "at least 6 characters" : null;

  void onEmailChange(val) {
    setState(() {
      email = val;
    });
  }

  String? validateEmail(value) => value!.isEmpty ? "write an email" : null;
  String? valideteName(value) =>
      value!.isEmpty ? "this section cannot be empty" : null;

  AppBar RegisterAppBar() {
    return AppBar(
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20)),
            onPressed: () {
              widget.setifSignIn();
            },
            child: const Text("Sign In"))
      ],
      elevation: 0,
      title: const Text("Register"),
      backgroundColor: Colors.amberAccent,
    );
  }
}

class CustomSizedWidget extends StatelessWidget {
  const CustomSizedWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
