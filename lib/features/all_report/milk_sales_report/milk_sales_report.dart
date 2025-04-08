import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../common/Widgets/date_picker.dart';
import '../../common/Widgets/milk_collection_report_widget.dart';
import '../../common/model/dairy_app_model.dart';

class MilkSalesReport extends StatelessWidget {
  const MilkSalesReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<MilkData> milkData = [
      MilkData(
        type: 'cow',
        amount: 70000,
        liter: 2000,
      ),
      MilkData(
        type: 'Buffalo',
        amount: 120000,
        liter: 3000,
      ),
    ];
    List<String> firstColumnHeaders = [
      'Date',
      'Shift',
      'Milk',
      'Liter',
      'Fat',
      'Snf',
      'Rate',
      'Amount',
    ];
    List<MilkReport> milkReport = [
      MilkReport(id: 'Buyer', name: 'Higani Dairy', milkReport: [
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '24 Jan 2024',
          shift: 'Morning',
          milk: '25',
          liter: '30',
          fat: '12',
          snf: '70',
          rate: '30',
          amount: '20000',
        ),
        MilkReportModel(
          date: '25 Jan 2024',
          shift: 'Evening',
          milk: '28',
          liter: '40',
          fat: '50',
          snf: '82',
          rate: '30',
          amount: '25000',
        ),
        MilkReportModel(
          date: '26 Jan 2024',
          shift: 'Morning',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '27 Jan 2024',
          shift: 'Evening',
          milk: '25',
          liter: '26',
          fat: '10',
          snf: '80',
          rate: '25',
          amount: '30000',
        ),
        MilkReportModel(
          date: '28 Jan 2024',
          shift: 'Morning',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '29 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '30 Jan 2024',
          shift: 'Morning',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
      ]),
      MilkReport(id: 'Buyer', name: 'Sumit Dairy', milkReport: [
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '24 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '25 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '26 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
      ]),
      MilkReport(id: 'Buyer', name: 'Rohan Dairy', milkReport: [
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '24 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '25 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '26 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
      ]),
      MilkReport(id: 'Buyer', name: 'Kale Dairy', milkReport: [
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '24 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '25 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '26 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
        MilkReportModel(
          date: '23 Jan 2024',
          shift: 'Evening',
          milk: '20',
          liter: '25',
          fat: '10',
          snf: '82',
          rate: '25',
          amount: '22282',
        ),
      ]),
    ];

    int totalLiters = milkData.fold(0, (sum, item) => sum + item.liter);
    int totalAmount = milkData.fold(0, (sum, item) => sum + item.amount);

    return SafeArea(
      child: Scaffold(
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Milk Sales Report',
          context: context,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: DatePicker(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 16,
                  child: SearchBar(
                    hintText: 'Search',
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(245, 245, 245, 1),
                    ),
                    trailing: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(2),
                  },
                  children: [
                    DefaultAppbar.buildRow(['Milk', 'Liter', 'Amount'],
                        isHeader: true),
                    ...milkData
                        .map((data) => DefaultAppbar.buildRow([
                              data.type,
                              data.liter.toString(),
                              '₹ ${data.amount}'
                            ], isDisabled: true))
                        .toList(),
                    DefaultAppbar.buildRow(
                        ['Total', totalLiters.toString(), '₹ $totalAmount'],
                        isTotal: true),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: milkReport.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: MilkCollectionReportWidget(
                    milkReport: milkReport,
                    firstColumnHeaders: firstColumnHeaders,
                    index: index,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
