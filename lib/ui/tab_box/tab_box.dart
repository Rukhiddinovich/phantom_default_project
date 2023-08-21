import 'package:default_project/cubits/tab_box/tab_box_cubit.dart';
import 'package:default_project/cubits/tab_box/tab_box_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../calculate/calculate_screen.dart';
import '../login/login_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabBoxCubit, TabBoxState>(
        builder: (context, state) {
          if (state is CalculateScreenState) {
            return const CalculateScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined,
                  color: Colors.white, size: 30.sp),
              label: "Calculate"),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.login_outlined, color: Colors.white, size: 30.sp),
              label: "Login")
        ],
        onTap: (onTap) {
          context.read<TabBoxCubit>().updateScreen(index: onTap);
        },
      ),
    );
  }
}
