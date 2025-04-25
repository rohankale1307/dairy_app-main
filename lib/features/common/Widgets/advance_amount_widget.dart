import 'package:dairy_app/features/common/model/dairy_app_model.dart';
import 'package:flutter/material.dart';

class AdvanceAmountWidget extends StatelessWidget {
  const AdvanceAmountWidget({
    super.key,
    required this.advanceAmtModel,
    required this.index,
    this.isDeductionAmount = false,
  });

  final List<AdvanceAmountModel> advanceAmtModel;
  final int index;
  final bool isDeductionAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          width: 2,
          color: const Color.fromRGBO(207, 207, 207, 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    advanceAmtModel[index].id,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    advanceAmtModel[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isDeductionAmount ? 'Deduction Amount' : 'Advance Amount',
                      style: const TextStyle(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      advanceAmtModel[index].amount,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  advanceAmtModel[index].note,
                  style: const TextStyle(
                    color: Color.fromRGBO(127, 127, 127, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  advanceAmtModel[index].date,
                  style: const TextStyle(color: Color.fromRGBO(92, 92, 92, 1)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
