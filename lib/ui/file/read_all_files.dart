import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';

class MusicFile extends StatefulWidget {
  const MusicFile({super.key});

  @override
  State<MusicFile> createState() => _MusicFileState();
}

class _MusicFileState extends State<MusicFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_26292D,
      appBar: AppBar(
        backgroundColor: AppColors.C_1A1C1F,
        elevation: 0,
        systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: AppColors.C_1A1C1F),
      ),
    );
  }
}
