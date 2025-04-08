import 'package:flutter/material.dart';

import '../model/dairy_app_model.dart';

class CollectionCardWidget extends StatelessWidget {
  const CollectionCardWidget({
    super.key,
    required this.collectionCardData,
    required this.index,
    required this.buildInfoColumn,
    this.isMilkCollection = false,
  });

  final List<CollectionCardData> collectionCardData;
  final int index;
  final List<Widget> buildInfoColumn;
  final bool isMilkCollection;

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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    isMilkCollection
                        ? 'Buyer'
                        : '${collectionCardData[index].id}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    collectionCardData[index].name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          if (collectionCardData[index].cattleFeedName != null)
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Text(
                collectionCardData[index].cattleFeedName ?? '',
                style: const TextStyle(
                  color: Color.fromRGBO(127, 127, 127, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: buildInfoColumn,
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
                  collectionCardData[index].dateTime ?? '',
                  style: const TextStyle(color: Color.fromRGBO(92, 92, 92, 1)),
                ),
                if (collectionCardData[index].milkType != null)
                  Text(
                    collectionCardData[index].milkType ?? '',
                    style: const TextStyle(
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

class BuildInfoColumn extends StatelessWidget {
  const BuildInfoColumn({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromRGBO(127, 127, 127, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
