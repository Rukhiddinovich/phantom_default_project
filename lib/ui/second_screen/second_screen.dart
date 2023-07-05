import 'package:default_project/ui/second_screen/widgets/textfield_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontFamily: "Poppins",
              color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.done),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const TextFieldScreen(title: "Name", hintText: "Enter name"),
            SizedBox(height: 20.h),
            const TextFieldScreen(title: "Surname", hintText: "Enter surname"),
            SizedBox(height: 20.h),
            const TextFieldScreen(title: "Phone number", hintText: "+998 _ _  _ _ _  _ _  _ _"),
          ],
        ),
      ),
    );
  }
}
