import 'package:dairy_app/features/common/Widgets/date_picker.dart';
import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../common/model/dairy_app_model.dart';
import 'view_all_reports.dart';

class NetPaymentReport extends StatelessWidget {
  const NetPaymentReport({super.key});

  @override
  Widget build(BuildContext context) {
    List<NetPaymentReportModel> netPaymentModel = [
      NetPaymentReportModel(
        id: '126',
        name: 'Rohan Kale',
        totalMilkAmt: '20000',
        totalCattleFeedAmt: '30000',
        totalDeductionAmt: '40000',
        totalNetPayment: '50000',
      ),
      NetPaymentReportModel(
        id: '127',
        name: 'Suraj Kale',
        totalMilkAmt: '20000',
        totalCattleFeedAmt: '30000',
        totalDeductionAmt: '40000',
        totalNetPayment: '50000',
      ),
      NetPaymentReportModel(
        id: '128',
        name: 'Rohini Kale',
        totalMilkAmt: '20000',
        totalCattleFeedAmt: '30000',
        totalDeductionAmt: '40000',
        totalNetPayment: '50000',
      ),
      NetPaymentReportModel(
        id: '129',
        name: 'Digvijay Kale',
        totalMilkAmt: '20000',
        totalCattleFeedAmt: '30000',
        totalDeductionAmt: '40000',
        totalNetPayment: '50000',
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar.defaultAppbar(
          title: 'Net Payment Report',
          context: context,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DatePicker(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
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
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      buildRow(
                        title: 'Total Milk Amt',
                        amount: 20000,
                      ),
                      buildRow(
                        title: 'Total Cattle Feed Amt',
                        amount: 20000,
                      ),
                      buildRow(
                        title: 'Total Deduction Amt',
                        amount: 20000,
                      ),
                      buildRow(
                        title: 'Total Net Payment',
                        amount: 20000,
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: netPaymentModel.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    child: NetPaymentWidget(
                      netPaymentModel: netPaymentModel,
                      index: index,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NetPaymentWidget extends StatelessWidget {
  const NetPaymentWidget({
    super.key,
    required this.netPaymentModel,
    required this.index,
  });

  final List<NetPaymentReportModel> netPaymentModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(207, 207, 207, 1),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: const Color.fromRGBO(199, 237, 217, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Text(
                          netPaymentModel[index].id,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          netPaymentModel[index].name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      buildCardRow(
                        title: 'Total Milk Amt',
                        amount: netPaymentModel[index].totalMilkAmt,
                      ),
                      buildCardRow(
                        title: 'Total Cattle Feed Amt',
                        amount: netPaymentModel[index].totalCattleFeedAmt,
                      ),
                      buildCardRow(
                        title: 'Total Deduction Amt',
                        amount: netPaymentModel[index].totalDeductionAmt,
                      ),
                      buildCardRow(
                        title: 'Total Net Payment',
                        amount: netPaymentModel[index].totalNetPayment,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: ViewReportButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ViewReportButton extends StatelessWidget {
  const ViewReportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewAllReports(),
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor:
            const WidgetStatePropertyAll(Color.fromRGBO(245, 245, 245, 1)),
        shape: WidgetStateProperty.all(
          const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'View All Reports',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class AdvanceRow extends StatelessWidget {
  const AdvanceRow({
    super.key,
    required this.totalAdv,
    required this.totalAmt,
  });

  final String totalAdv;
  final int totalAmt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          totalAdv,
          style: const TextStyle(
            color: Color.fromRGBO(127, 127, 127, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          totalAmt.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

Widget buildRow({
  required String title,
  required int amount,
  bool isTotal = false,
}) {
  return Container(
    color: isTotal ? const Color.fromRGBO(127, 127, 127, 0.3) : null,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isTotal
                    ? Colors.black
                    : const Color.fromRGBO(127, 127, 127, 1),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              amount.toString(),
              style: TextStyle(
                color: isTotal
                    ? Colors.black
                    : const Color.fromRGBO(127, 127, 127, 1),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCardRow({
  required String title,
  required String amount,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(127, 127, 127, 1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '₹ $amount',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
