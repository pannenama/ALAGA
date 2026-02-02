import 'package:flutter/material.dart';

import '../../../Facility/Screen/FacilityScreen.dart';

class FacilitiesPage extends StatelessWidget {
  const FacilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: FacilityScreen(),
    );
  }
}
