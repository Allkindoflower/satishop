import 'package:flutter/material.dart';
import 'package:satishop/second_screen.dart';

class MiniCard extends StatelessWidget {
  const MiniCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            ),
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.network(
                  "https://freesvg.org/img/abstract-user-flat-4.png",
                  width: 60,
                  height: 60,
                ),

                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Uğur Baştuğ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Python Developer"),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_outlined, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
