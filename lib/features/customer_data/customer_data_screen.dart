import 'package:dairy_app/features/common/Widgets/default_appbar.dart';
import 'package:dairy_app/features/customer_data/add_new_customer.dart';
import 'package:flutter/material.dart';

import '../common/Widgets/button_widget.dart';

class CustomerDataScreen extends StatelessWidget {
  const CustomerDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppbar.defaultAppbar(
        title: 'Customer List',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewCustomer(
                        isEdit: true,
                      ),
                    ),
                  );
                },
                child: const NewCustomerWidget()),
          ),
        ),
      ),
      floatingActionButton: Buttons.addCollectionButton(
        title: 'New Customer',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewCustomer(
                isEdit: false,
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewCustomerWidget extends StatelessWidget {
  const NewCustomerWidget({
    super.key,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromRGBO(245, 245, 245, 1),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '125',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Rohan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '7058426247',
                      style: TextStyle(color: Color.fromRGBO(92, 92, 92, 1)),
                    ),
                  ],
                ),
                Text(
                  'Joined on 2 Jan 2025',
                  style: TextStyle(
                    color: Color.fromRGBO(92, 92, 92, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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
