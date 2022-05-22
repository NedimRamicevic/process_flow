import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:process_flow/provider/bottom_navbar_provider.dart';
import 'package:process_flow/provider/firestore_database_service.dart';
import 'package:process_flow/screens/tasks/home.dart';
import 'package:provider/provider.dart';
import './theme/light_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    Provider(create: (context) => FirestoreDatabaseService(uid: "11")),
    Provider(create: (context) => BottomNavBarNotfier())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: LighTheme().theme, title: 'Flutter Demo', home: const Home());
  }
}
