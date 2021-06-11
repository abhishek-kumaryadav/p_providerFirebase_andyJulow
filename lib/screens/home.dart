import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_andy_2/providers/report.dart';
import 'package:provider_andy_2/screens/settings.dart';
import 'package:provider_andy_2/services/firestore_service.dart';

// import '';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reports = Provider.of<List<Report>>(context);
    // print(reports.toString());
    FirestoreService _db = FirestoreService();
    return Scaffold(
      appBar: AppBar(
        title: Text("WAXAPP"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Settings()));
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: reports.length,
      //   itemBuilder: (context, index) {
      //     Report report = reports[index];
      //     return ListTile(
      //       leading: Text(report.temp.toString()),
      //       title: Text(report.wax),
      //       subtitle: Text(report.line),
      //       trailing: Text(formatDate(
      //           DateTime.parse(report.timeStamp), [h, ":", nn, " ", am])),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _db.addReport();
        },
      ),
    );
  }
}
