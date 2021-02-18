import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../common/config/responsive.dart';

part 'timeline/item_card.dart';
part 'timeline/success.dart';
part 'timeline/progress.dart';
part 'timeline/failure.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance
        .collection('timeline')
        .limit(10)
        .orderBy('created_at', descending: true);

    return StreamBuilder<QuerySnapshot>(
      stream: query.snapshots(),
      builder: (context, stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return Progress();
        }
        if (stream.hasError) {
          return Failure();
        }
        return Success(querySnapshot: stream.data);
      },
    );
  }
}
