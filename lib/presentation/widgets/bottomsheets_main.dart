import 'package:data_setup/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class MainBottomSheet extends StatefulWidget {
  @override
  _MainBottomSheetState createState() => _MainBottomSheetState();
}

class _MainBottomSheetState extends State<MainBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.orange,
      child: Center(
        child: Text(
          'Flash Workout Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
