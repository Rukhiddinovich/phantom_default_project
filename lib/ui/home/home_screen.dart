import 'package:default_project/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/models/status/form_status.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Users info",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<UserProvider>(
            builder: (context, provider, child) {
              switch (provider.status) {
                case FormStatus.pure:
                  return const Text("There is no information");
                case FormStatus.success:
                  return Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(
                          provider.users!.length,
                          (index) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    provider.users![index].title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Text(
                                    "Id: ${provider.users![index].id.toString()}",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  trailing: Text(
                                    "User Id: ${provider.users![index].userId.toString()}",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Poppins",
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                case FormStatus.failure:
                  return Center(child: Text(provider.errorText));
                case FormStatus.loading:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
