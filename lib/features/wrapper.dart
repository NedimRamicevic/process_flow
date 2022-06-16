import 'package:flutter/material.dart';
import 'package:process_flow/provider/workerProvider.dart';

import 'package:provider/provider.dart';

import 'authentication/authenticate.dart';
import 'taskList/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: true).currentUser;

    //return Home or Authenticate widget
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
