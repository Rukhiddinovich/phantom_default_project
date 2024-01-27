import 'package:default_project/provider/theme_provider.dart';
import 'package:default_project/utils/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool receiveNotifications = true;
  bool darkMode = false;
  String selectedLanguage = 'English';
  double fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.chevron_back,
          ),
        ),
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? AppColors.C_32383E
                      : AppColors.passiveTextColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Notifications',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                    trailing: CupertinoSwitch(
                      trackColor: Colors.grey.shade100,
                      value: receiveNotifications,
                      onChanged: (value) {
                        setState(() {
                          receiveNotifications = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'App Theme',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                    trailing: CupertinoSwitch(
                      trackColor: Colors.grey.shade100,
                      value: Provider.of<ThemeProvider>(context).isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? AppColors.C_32383E
                      : AppColors.passiveTextColor,
                  borderRadius: BorderRadius.circular(16)),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          child: 
                            ListView(
                              children: const [
                              Text(
                                "The Morse code alphabet is a method of encoding text characters using sequences of dots (short signals) and dashes (long signals) to represent letters, numerals, and punctuation. It was developed by Samuel Morse and Alfred Vail in the 1830s and 1840s for use with their newly invented telegraph.\nHere is the Morse code representation for each letter of the English alphabet:\nA: .-        N: -.        0: -----\nB: -...      O: ---       1: .----\nC: -.-.      P: .--.      2: ..---\nD: -..       Q: --.-      3: ...--\nE: .         R: .-.       4: ....-\nF: ..-.      S: ...       5: .....\nG: --.       T: -         6: -....\nH: ....      U: ..-       7: --...\nI: ..        V: ...-      8: ---..\nJ: .---      W: .--       9: ----.\nK: -.-       X: -..-\nL: .-..      Y: -.--\nM: --        Z: --..\nPunctuation and special characters also have Morse code representations. The Morse code is a simple and efficient way to transmit information through telegraphy, and it has also been used in various other communication systems over the years.",
                              ),
                            ]),
                          
                        );
                      });
                },
                child: const ListTile(
                  title: Text(
                    'What is Morse Alphabet?',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                  trailing: Icon(
                    CupertinoIcons.chevron_compact_right,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     _resetSettings();
            //   },
            //   child: const Text('Reset to Default'),
            // ),
          ],
        ),
      ),
    );
  }

  void _resetSettings() {
    setState(() {
      receiveNotifications = true;
      darkMode = false;
      selectedLanguage = 'English';
      fontSize = 16.0;
    });
  }
}
