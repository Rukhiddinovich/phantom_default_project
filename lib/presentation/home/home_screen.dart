import 'package:default_project/data/models/model.dart';
import 'package:default_project/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ContactModel? lastDeletedContact;
  int? lastIndexDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Contact Screen",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ReorderableListView(
        children: [
          ...List.generate(
            contacts.length,
            (index) {
              return Dismissible(
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(16.r),
                  color: Colors.red,
                  child: Icon(CupertinoIcons.delete,
                      size: 26.r, color: Colors.white),
                ),
                key: UniqueKey(),
                child: Column(
                  children: [
                    ListTile(
                      key: ValueKey(index),
                      title: Text(
                        contacts[index].name,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Colors.black),
                      ),
                      subtitle: Text(
                        contacts[index].phone,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.black),
                      ),
                      trailing: Text(
                        contacts[index].data,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Colors.black),
                      ),
                    ),
                    Divider(color: Colors.teal, height: 1.h),
                  ],
                ),
                onDismissed: (direction) {
                  setState(
                    () {
                      lastDeletedContact = contacts[index];
                      lastIndexDeleted = index;
                      contacts.removeAt(index);
                    },
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${contacts[index].name} deleted"),
                      action: SnackBarAction(
                        label: "Undo",
                        textColor: Colors.blue,
                        onPressed: () {
                          setState(() {
                            if (lastIndexDeleted != null &&
                                lastDeletedContact != null) {
                              contacts.insert(
                                  lastIndexDeleted!, lastDeletedContact!);
                              lastDeletedContact = null;
                              lastIndexDeleted = null;
                            }
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final ContactModel item = contacts.removeAt(oldIndex);
            contacts.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
