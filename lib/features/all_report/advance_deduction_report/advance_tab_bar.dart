import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import 'advance_deduction_statement.dart';
import 'advance_history_screen.dart';

class AdvanceTabBar extends StatefulWidget {
  const AdvanceTabBar({super.key});

  @override
  State<AdvanceTabBar> createState() => _AdvanceTabBarState();
}

// List<CattleFeedData> cattleFeedData = [
//   CattleFeedData(
//     feedName: 'Hindustan Cattle Feed',
//     quantity: 10,
//     amount: 10000,
//   ),
//   CattleFeedData(
//     feedName: 'Amul Cattle Feed',
//     quantity: 8,
//     amount: 8000,
//   ),
// ];

// List<CollectionCardData> cattleFeedSalesList = [
//   CollectionCardData(
//     cattleFeedName: 'Hindustan Sugras',
//     id: 125,
//     name: 'Suraj Chavan',
//     qty: 2,
//     amount: 2000,
//     rate: 1000,
//     dateTime: '15/04/2025',
//   ),
//   CollectionCardData(
//     cattleFeedName: 'Hindustan Sugras',
//     id: 125,
//     name: 'Suraj Chavan',
//     qty: 2,
//     amount: 2000,
//     rate: 1000,
//     dateTime: '15/04/2025',
//   ),
//   CollectionCardData(
//     cattleFeedName: 'Hindustan Sugras',
//     id: 125,
//     name: 'Suraj Chavan',
//     qty: 2,
//     amount: 2000,
//     rate: 1000,
//     dateTime: '14/04/2025',
//   ),
//   CollectionCardData(
//     cattleFeedName: 'Hindustan Sugras',
//     id: 125,
//     name: 'Suraj Chavan',
//     qty: 2,
//     amount: 2000,
//     rate: 1000,
//     dateTime: '13/04/2025',
//   ),
//   CollectionCardData(
//     cattleFeedName: 'Hindustan Sugras',
//     id: 125,
//     name: 'Suraj Chavan',
//     qty: 2,
//     amount: 2000,
//     rate: 1000,
//     dateTime: '12/04/2025',
//   ),
// ];

class _AdvanceTabBarState extends State<AdvanceTabBar> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Advance & Deduction Statement',
          context: context,
          isShowDatePicker: true,
          isShowSearchIcon: true,
          bottomWidget: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            AdvanceDeductionStatement(),
            AdvanceHistoryScreen(),
          ],
        ),
      ),
    );
  }

  TabBar get _tabBar => TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        indicatorColor: Colors.black,
        onTap: (int index) {
          setState(() {
            tabIndex = index;
          });
        },
        tabs: const [
          Tab(
            child: Text(
              'Current',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'History',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
}
