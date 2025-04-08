import 'package:flutter/material.dart';

import '../advance_amount/advance_amount_screen.dart';
import '../all_report/all_report_screen.dart';
import '../cattle_feed/cattle_field_screen.dart';
import '../customer_data/customer_data_screen.dart';
import '../deduction_amount/deduction_amount_screen.dart';
import '../milk_collection/milk_collection_screen.dart';

class DairyAppLandingPage extends StatelessWidget {
  DairyAppLandingPage({super.key});

  final List<CatlogCardModel> catlogCardList = [
    CatlogCardModel(title: 'Milk Collection', imagePath: 'milk_collection.png'),
    CatlogCardModel(title: 'Cattle Feed', imagePath: 'cattle_feed.png'),
    CatlogCardModel(title: 'Advance', imagePath: 'advance.png'),
    CatlogCardModel(title: 'Deduction', imagePath: 'deduction.png'),
    CatlogCardModel(title: 'Milk Sales', imagePath: 'milk_sales.png'),
    CatlogCardModel(title: 'Dairy Expenses', imagePath: 'daily_expenses.png'),
    CatlogCardModel(title: 'Customers', imagePath: 'customers.png'),
    CatlogCardModel(title: 'Reports', imagePath: 'reports.png'),
    CatlogCardModel(
        title: 'My Dairy Account', imagePath: 'my_dairy_account.png'),
  ];

  void getNavigation({
    required final BuildContext context,
    required final String categoryName,
  }) {
    if (categoryName == 'Milk Collection') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MilkCollectionScreen(),
        ),
      );
    } else if (categoryName == 'Cattle Feed') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CattleFieldScreen(),
        ),
      );
    } else if (categoryName == 'Advance') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdvanceAmountScreen(),
        ),
      );
    } else if (categoryName == 'Deduction') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DeductionAmountScreen(),
        ),
      );
    } else if (categoryName == 'Milk Sales') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MilkCollectionScreen(),
        ),
      );
    } else if (categoryName == 'Dairy Expenses') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DairyAppLandingPage(),
        ),
      );
    } else if (categoryName == 'Customers') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomerDataScreen(),
        ),
      );
    } else if (categoryName == 'Reports') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AllReportScreen(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DairyAppLandingPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Name of the Dairy',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: catlogCardList.length,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => CatlogCard(
                title: catlogCardList[index].title,
                imagePath: catlogCardList[index].imagePath,
                onTap: () {
                  getNavigation(
                    context: context,
                    categoryName: catlogCardList[index].title,
                  );
                }),
          ),
        ],
      ),
    ));
  }
}

class CatlogCard extends StatelessWidget {
  const CatlogCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String imagePath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 245, 245, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image(
                image: AssetImage(
                  'assets/images/$imagePath',
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 8),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CatlogCardModel {
  final String title;
  final String imagePath;

  CatlogCardModel({required this.title, required this.imagePath});
}
