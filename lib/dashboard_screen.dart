import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final String name;

  const DashboardScreen({super.key, required this.name});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool notification = false;
  bool darkMode = false;
  double volume = 0.0;
  String gender = "Male";
  List<String> names = ["Ugur", "Micheal", "Ethan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Dashboard"), backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to your dashboard,",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            SizedBox(height: 4),

            Text(
              widget.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications"),
                Checkbox(
                  value: notification,
                  onChanged: (value) {
                    setState(() {
                      notification = value!;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark mode"),

                Switch(
                  value: darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Volume")),

                Expanded(
                  flex: 2,
                  child: Slider(
                    min: 0.0,
                    max: 100.0,
                    value: volume,
                    // divisions: 10,
                    label: volume.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        volume = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
            RadioGroup(
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<String>(value: "Male"),
                  Text("Male"),
                  Radio<String>(value: "Female"),
                  Text("Female"),
                  Radio<String>(value: "Other"),
                  Text("Other"),
                ],
              ),
            ),

            SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your settings:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 4),

                  Text("Notifications: ${notification ? "On" : "Off"}"),
                  Text("Dark Mode: ${darkMode ? "On" : "Off"}"),
                  Text("Volume: ${volume.round()}"),
                  Text("Your gender: $gender"),
                ],
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  var name = names[index];

                  return Text(name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
