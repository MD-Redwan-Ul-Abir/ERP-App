import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GradientContainer extends StatelessWidget {
  final Color color;
  final double numbers;
  final String text;
  final String iconPath;
  final double progressLine;

  const GradientContainer({
    Key? key,
    required this.color,
    required this.numbers,
    required this.text,
    required this.iconPath,
    required this.progressLine, // SVG icon path parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 130.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.6), // Lighter shade
            color, // Original color
            color.withOpacity(0.9), // Darker shade
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    numbers.toString(),
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset(
                    iconPath, // Display the SVG icon from the provided path
                    color: Colors.white,
                    width: 24.sp,
                    height: 24.sp,
                  ),
                ],
              ),
            ),
            SizedBox(height: 27.h),
            // Progress indicator line
            LinearPercentIndicator(
              //width: 100.w,
              backgroundColor: Colors.black26,
              lineHeight: 4.h,
              percent: progressLine,
              progressColor: Colors.white,
            ),
            Spacer(),
            // Bottom text
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text(
                text,
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
