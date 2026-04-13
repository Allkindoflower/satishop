import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              customContainer(),
              customContainer(),
              customContainer(),
              customContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Container customContainer() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.deepPurple,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 16),
          ),
        ],
      ),
    );
  }
}
