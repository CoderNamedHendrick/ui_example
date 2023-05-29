import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/assetx.dart';
import 'package:practice/constants.dart';
import 'package:practice/views/form_page.dart';
import 'package:practice/widgets/notification_icon.dart';
import 'package:practice/widgets/widgets.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Align(
          child: CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.2),
            child:
                Icon(Icons.abc, color: Theme.of(context).colorScheme.primary),
          ),
        ),
        title: Text(
          'Hi, Linda!',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        actions: [
          const Align(child: NotificationIcon.inverse()),
          SizedBox(width: DimConstants.horizontalMargin.dim),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DimConstants.horizontalMargin.dim,
          vertical: DimConstants.verticalMargin.dim,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: TextSpan(
                text: 'Student Name: ',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
                children: [
                  TextSpan(
                    text: 'Esther Harry',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  )
                ],
              ),
            ),
            SizedBox(height: DimConstants.largeVerticalGutter.dim),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewPadding.bottom,
                  ),
                  child: Column(
                    children: [
                      const _SessionCard(),
                      SizedBox(
                          height: DimConstants.largeVerticalGutter.dim + 10),
                      TitleTile.variant1(
                        title: 'Report Lateness',
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.earbuds,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const FormPage()),
                        ),
                      ),
                      SizedBox(height: DimConstants.verticalMargin.dim),
                      TitleTile.variant2(
                        title: 'Report Absence',
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.earbuds,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: DimConstants.verticalMargin.dim),
                      TitleTile.variant3(
                        title: 'View Attendance',
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.earbuds,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: DimConstants.largeVerticalGutter.dim + 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Option(
                            label: 'Events',
                            value: 0,
                            groupValue: index,
                            onChanged: (value) => setState(() => index = value),
                          ),
                          const SizedBox(width: 10),
                          Option(
                            label: 'History',
                            value: 1,
                            groupValue: index,
                            onChanged: (value) => setState(() => index = value),
                          ),
                        ],
                      ),
                      SizedBox(height: DimConstants.largeVerticalGutter.dim),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Upcoming Events'),
                          Text('see all'),
                        ],
                      ),
                      SizedBox(height: DimConstants.largeVerticalGutter.dim),
                      EventTile.outlined(
                        eventTime: DateTime(2022, 3, 18, 14),
                        eventTitle: 'Graduating Day',
                      ),
                      SizedBox(height: DimConstants.largeVerticalGutter.dim),
                      EventTile(
                        eventTime: DateTime(2023, 5, 20, 9, 8),
                        eventTitle: 'FTS Meeting',
                      ),
                      SizedBox(height: DimConstants.largeVerticalGutter.dim),
                      EventTile(
                        eventTime: DateTime(2023, 6, 10, 6, 50),
                        eventTitle: 'Love you till I die day',
                      ),
                      SizedBox(height: DimConstants.largeVerticalGutter.dim),
                      EventTile.outlined(
                        eventTime: DateTime(2025, 1, 10, 6),
                        eventTitle: 'Another Anniversary sweetheart',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(DimConstants.borderRadius.dim)),
        ),
      ),
      height: 110,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset('session_ellipse_1'.svg, height: 100),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'session_ellipse_2'.svg,
              height: 100,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '2022/2023 Session',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: DimConstants.largeVerticalGutter.dim),
                  Row(
                    children: [
                      const Expanded(
                          child: _Info(title: 'Total Days Absent', info: '04')),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 30,
                          width: 1,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      const Expanded(
                          child:
                              _Info(title: 'Total Days Present', info: '16')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({Key? key, required this.title, required this.info})
      : super(key: key);
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.8,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          info,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.8,
              ),
        ),
      ],
    );
  }
}
