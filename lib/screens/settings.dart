import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_andy_2/providers/settings_provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Units"),
                DropdownButton<String>(
                  value: settingsProvider.units,
                  items: <String>['Imperial', 'Metric']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    settingsProvider.setUnits(value!);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Wax Lines"),
                Container(
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      FilterChip(
                        label: Text('Swix'),
                        selected: (settingsProvider.waxLines.contains('Swix'))
                            ? true
                            : false,
                        onSelected: (bool value) {
                          //TODO:
                          if (value == true) {
                            settingsProvider.addWaxLine('Swix');
                          } else {
                            settingsProvider.removeWaxLine('Swix');
                          }
                        },
                      ),
                      FilterChip(
                        label: Text('Toko'),
                        selected: (settingsProvider.waxLines.contains('Toko'))
                            ? true
                            : false,
                        onSelected: (bool value) {
                          //TODO:
                          if (value == true) {
                            settingsProvider.addWaxLine('Toko');
                          } else {
                            settingsProvider.removeWaxLine('Toko');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
