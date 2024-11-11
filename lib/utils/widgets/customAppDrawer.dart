import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_asets.dart';

import '../routes.dart';
import '../../view/Purchase.dart';
import '../../view/Dashboard.dart';

class DrawerControllerX extends GetxController {
  var expandedIndex = (-1).obs;

  void toggleExpansion(int index) {
    expandedIndex.value = expandedIndex.value == index ? -1 : index;
  }
}

class CustomAppDrawer extends StatelessWidget {
  final DrawerControllerX drawerController = Get.put(DrawerControllerX());

  final List<DrawerItemData> drawerItems = [
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Dashboard',
      children: [
        CustomListTile(
          title: 'Home',
          onTap: () {
            Get.to(
                () => const homePage()); // Ensure HomePage is correctly defined
          },
        ),
      ],
    ),
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Employees',
      children: [
        CustomListTile(
          title: 'Employee List',
          onTap: () {
            print('Navigate to Employee List');
          },
        ),
      ],
    ),
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Add New Purchase',
      children: [
        CustomListTile(
          title: 'Purchase',
          onTap: () {
            Get.to(() => PurchaseFormPage());
          },
        ),
      ],
    ),
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Employees',
      children: [
        CustomListTile(
          title: 'Employee List',
          onTap: () {
            print('Navigate to Employee List');
          },
        ),
      ],
    ),
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Employees',
      children: [
        CustomListTile(
          title: 'Employee List',
          onTap: () {
            print('Navigate to Employee List');
          },
        ),
      ],
    ),
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Employees',
      children: [
        CustomListTile(
          title: 'Employee List',
          onTap: () {
            print('Navigate to Employee List');
          },
        ),
      ],
    ),
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Employees',
      children: [
        CustomListTile(
          title: 'Employee List',
          onTap: () {
            print('Navigate to Employee List');
          },
        ),
      ],
    ),
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Employees',
      children: [
        CustomListTile(
          title: 'Employee List',
          onTap: () {
            print('Navigate to Employee List');
          },
        ),
      ],
    ),
    DrawerItemData(
      iconPath: AppAssets.dashboard,
      title: 'Projects',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 30.h,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'App Drawer',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20.sp,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            Obx(() => Column(
                  children: drawerItems.asMap().entries.map((entry) {
                    int index = entry.key;
                    DrawerItemData item = entry.value;

                    return CustomDrawerItem(
                      key: UniqueKey(),
                      itemData: item,
                      isExpanded: drawerController.expandedIndex.value == index,
                      onExpansionChanged: (isExpanded) {
                        drawerController.toggleExpansion(index);
                      },
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }
}

class DrawerItemData {
  final String? iconPath;
  final String title;
  final List<Widget> children;

  DrawerItemData({
    this.iconPath,
    required this.title,
    this.children = const [],
  });
}

class CustomListTile extends StatelessWidget {
  final String? iconPath;
  final String title;
  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    this.iconPath,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconPath != null
          ? SvgPicture.asset(
              iconPath!,
              width: 21,
              height: 21,
            )
          : null, // Handle null iconPath
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  final DrawerItemData itemData;
  final bool isExpanded;
  final ValueChanged<bool> onExpansionChanged;

  const CustomDrawerItem({
    required Key key,
    required this.itemData,
    required this.isExpanded,
    required this.onExpansionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemData.children.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: CustomListTile(
          iconPath: itemData.iconPath,
          title: itemData.title,
          onTap: () {
            print('Navigate to ${itemData.title}');
            // Add navigation logic here if needed
          },
        ),
      );
    } else {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: ExpansionTile(
            leading: itemData.iconPath != null
                ? SvgPicture.asset(
                    itemData.iconPath!,
                    width: 21,
                    height: 21,
                  )
                : null, // Handle null iconPath
            title: Text(
              itemData.title,
              style: GoogleFonts.roboto(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            children: itemData.children,
            initiallyExpanded: isExpanded,
            onExpansionChanged: onExpansionChanged,
            maintainState: true,
          ),
        ),
      );
    }
  }
}
