import 'package:erp/utils/app_asets.dart';
import 'package:erp/utils/widgets/dashboardCard.dart';
import 'package:erp/utils/widgets/customAppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(Icons.message, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.white, // Customize as needed
      ),
      drawer: CustomAppDrawer(),
      body: Container(
        height: double.infinity,
        color: Colors.grey[200], // Light gray background
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.0, right: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dashboard Overview',
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Colors.black38,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calendar_month, // Calendar icon
                          color: Colors.white,
                          size: 18,
                        ),
                        label: Text(
                          "Filter by date",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red, // Red background color
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4), // Rounded corners
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                GradientContainer(
                  color: Colors.blue,
                  numbers: 10,
                  text: 'Total Users',
                  iconPath: AppAssets.users,
                  progressLine: 0.7,
                ),
                SizedBox(
                  height: 13.h,
                ),
                GradientContainer(
                  color: Colors.purple,
                  numbers: 10,
                  text: 'Total Supplier',
                  iconPath: AppAssets.supplier,
                  progressLine: 0.3,
                ),
                SizedBox(
                  height: 13.h,
                ),
                GradientContainer(
                  color: Colors.green,
                  numbers: 10,
                  text: 'Total Customers',
                  iconPath: AppAssets.customers,
                  progressLine: 0.9,
                ),
                SizedBox(
                  height: 13.h,
                ),
                GradientContainer(
                  color: Colors.orange,
                  numbers: 10,
                  text: 'Total Income',
                  iconPath: AppAssets.income,
                  progressLine: 0.5,
                ),
                SizedBox(
                  height: 0.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
