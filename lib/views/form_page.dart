import 'package:flutter/material.dart';
import 'package:practice/constants.dart';
import 'package:practice/widgets/dropdown.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DimConstants.horizontalMargin.dim,
          vertical: DimConstants.verticalMargin.dim,
        ),
        child: Column(
          children: [
            CustomDropdown(
              dropdownValue: null,
              withHint: false,
              onChanged: (value) {},
              items: const [
                'Missed my loml',
                'Have to see my loml',
                'Went to see my loml'
              ],
            ),
          ],
        ),
      ),
    );
  }
}
