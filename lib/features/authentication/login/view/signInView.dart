import 'package:flutter/material.dart';
import 'package:process_flow/provider/workerProvider.dart';
import 'package:provider/provider.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/loading.dart';
import '../service/authService.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.setifSignIn}) : super(key: key);
  final Function setifSignIn;
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.amber,
            appBar: AppBar(
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(horizontal: 20)),
                    onPressed: () {
                      widget.setifSignIn();
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
              backgroundColor: Colors.amberAccent,
              elevation: 0,
              title: const Text("Sign In"),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                  key: _registerKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "E-mail",
                        ),
                        onChanged: onEmailChanged,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "Password",
                        ),
                        obscureText: true,
                        onChanged: onPassChanhed,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(error),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20)),
                          onPressed: onSignInPressed,
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  )),
            ),
          );
  }

  void onEmailChanged(val) {
    setState(() {
      email = val;
    });
  }

  void onPassChanhed(val) {
    setState(() {
      password = val;
    });
  }

  void onSignInPressed() async {
    if (_registerKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() {
          loading = false;
          error = "wrong email or password";
        });
      } else {
        Provider.of<WorkerProvider>(context).getWorker(result);
      }
    }
  }
}
