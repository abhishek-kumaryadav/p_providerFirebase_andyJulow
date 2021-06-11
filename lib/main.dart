import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_andy_2/providers/settings_provider.dart';
import 'package:provider_andy_2/screens/home.dart';
import 'package:provider_andy_2/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'providers/report.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirestoreService _db = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => SettingsProvider()),
        StreamProvider<List<Report>>(
          create: (BuildContext context) => _db.getReports(),
          initialData: [
            Report(-4, "Red", "Toko", "2021-06-08T19:02:49.657496")
          ],
        )
      ],
      //ADD PROVIDER,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ANDY JULOW CHANGE NOTIFIER',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.lightBlueAccent,
        ),
        home: Home(),
      ),
    );
  }
}
