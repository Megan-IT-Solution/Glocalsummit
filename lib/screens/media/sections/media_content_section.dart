import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';

class MediaContentSection extends StatelessWidget {
  const MediaContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Dimensions.getSectionPadding(context),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'In the News',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          const Text(
            'Press releases and media coverage coming soon...',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
