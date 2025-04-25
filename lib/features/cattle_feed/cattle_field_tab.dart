import 'package:dairy_app/features/cattle_feed/cattle_feed_rate_screen.dart';
import 'package:dairy_app/features/common/Widgets/button_widget.dart';
import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../common/model/dairy_app_model.dart';
import 'add_new_cattle_feed_rate.dart';
import 'add_new_cattle_feed_sale.dart';
import 'cattle_feed_screen.dart';

class CattleFieldScreen extends StatefulWidget {
  const CattleFieldScreen({super.key});

  @override
  State<CattleFieldScreen> createState() => _CattleFieldScreenState();
}

List<CattleFeedData> cattleFeedData = [
  CattleFeedData(
    feedName: 'Hindustan Cattle Feed',
    quantity: 10,
    amount: 10000,
  ),
  CattleFeedData(
    feedName: 'Amul Cattle Feed',
    quantity: 8,
    amount: 8000,
  ),
];

List<CollectionCardData> cattleFeedSalesList = [
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '15/04/2025',
  ),
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '15/04/2025',
  ),
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '14/04/2025',
  ),
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '13/04/2025',
  ),
  CollectionCardData(
    cattleFeedName: 'Hindustan Sugras',
    id: 125,
    name: 'Suraj Chavan',
    qty: 2,
    amount: 2000,
    rate: 1000,
    dateTime: '12/04/2025',
  ),
];

class _CattleFieldScreenState extends State<CattleFieldScreen> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Cattle feed',
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
        body: TabBarView(
          children: [
            CattleFeedSales(
              cattleFeedData: cattleFeedData,
              cattleFeedSalesList: cattleFeedSalesList,
            ),
            const CattleFeedRateScreen(),
          ],
        ),
        floatingActionButton: Buttons.addCollectionButton(
          title: tabIndex == 0 ? 'Add Sales' : 'New Cattle Feed',
          onPressed: () {
            if (tabIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewCattleFeedSale(
                    isEdit: false,
                  ),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewCattleFeedRate(
                    isEdit: false,
                  ),
                ),
              );
            }
          },
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
              'Sales',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Rate',
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
