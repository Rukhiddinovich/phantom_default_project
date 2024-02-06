import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CupertinoActionItem extends StatelessWidget {
  const CupertinoActionItem(
    this.onTap,
    this.text,
    this.textColor, {
    super.key,
    required this.buttonColor,
  });

  final VoidCallback onTap;
  final String text;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: buttonColor,
      child: CupertinoActionSheetAction(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: textColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
