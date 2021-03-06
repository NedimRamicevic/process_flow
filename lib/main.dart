import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:process_flow/features/wrapper.dart';
import 'package:process_flow/provider/bottom_navbar_provider.dart';
import 'package:process_flow/provider/workerProvider.dart';
import './features/taskList/task/service/firestore_database_service.dart';
import 'package:provider/provider.dart';
import 'shared/theme/light_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Provider(
      create: ((context) => FirestoreDatabaseService(uid: "uid")),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: LighTheme().theme,
        title: 'Flutter Demo',
        home: MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => BottomNavBarNotfier()),
          ChangeNotifierProvider(create: ((context) => UserProvider()))
        ], child: const Wrapper()));
  }
}
