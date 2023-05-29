import 'package:flutter/material.dart';
import 'package:practice/constants.dart';
import 'package:practice/widgets/dropdown.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? dropdownValue;
  int? daysAbsent;

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
              dropdownValue: dropdownValue,
              withHint: false,
              onChanged: (value) {
                setState(() {
                  dropdownValue = value;
                });
              },
              items: const [
                'Missed my loml',
                'Have to see my loml',
                'Went to see my loml'
              ],
            ),
            ListTile(
              title: const Text('Range picker'),
              trailing: daysAbsent != null ? Text('$daysAbsent days') : null,
              onTap: () async {
                final range = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                );

                if (range != null) {
                  setState(() {
                    daysAbsent = range.end.difference(range.start).inDays;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
