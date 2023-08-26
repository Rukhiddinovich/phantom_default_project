import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';

class GlobalTextFieldPassword extends StatefulWidget {
  const GlobalTextFieldPassword({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textAlign,
    required this.prefixIcon,
    this.obscureText = false,
    this.maxLine = 1,
    required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final bool obscureText;
  final int maxLine;
  final IconData prefixIcon;
  final ValueChanged<String> onChanged;

  @override
  State<GlobalTextFieldPassword> createState() =>
      _GlobalTextFieldPasswordState();
}

class _GlobalTextFieldPasswordState extends State<GlobalTextFieldPassword> {
  bool _isPasswordVisible = false;

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.5),
            blurRadius: 10.r,
            offset: const Offset(5, 5),
          )
        ],
      ),
      child: TextField(
        maxLines: widget.maxLine,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          fontFamily: "Poppins",
        ),
        onChanged: widget.onChanged,
        textAlign: widget.textAlign,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        obscureText: widget.keyboardType == TextInputType.visiblePassword
            ? !_isPasswordVisible
            : widget.obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontFamily: "Poppins",
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.white),
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Colors.black,
          ),
          suffixIcon: widget.keyboardType == TextInputType.visiblePassword
              ? IconButton(
                  splashRadius: 1.r,
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
