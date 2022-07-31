import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';
import '../../../../../Generic/Sidebar.dart';
import '../../../../../core/components/cards.dart';

class LandingPage extends StatefulWidget {
  final String name;
  final String email;
  const LandingPage({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      PRIMARY_COLOR,
      OFFERS_COLOR,
      SECOND_COLOR,
      Colors.green.withOpacity(0.1)
    ];

    bool showAvg = false;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Sidebar(name: widget.name, email: widget.email, context: context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 35,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }
        ),
        elevation: 0.25,
        title: Text(
          'Homepage',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(color: BACKGROUND_COLOR),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                subText('Summary', fontSize: 16),
                const Divider(),
                addVertical(10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: size.height * 0.275,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    height: 250,
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.white,
                    ),
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          horizontalInterval: 1,
                          verticalInterval: 1,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 1,
                              // getTitlesWidget: bottomTitleWidgets,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              // getTitlesWidget: leftTitleWidgets,
                              reservedSize: 42,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                                color: const Color(0xff37434d), width: 1)),
                        minX: 0,
                        maxX: 7,
                        minY: 0,
                        maxY: 4,
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 3),
                              FlSpot(2.6, 2),
                              FlSpot(4.9, 4),
                              FlSpot(6.8, 3),
                              FlSpot(7, 4.2),
                            ],
                            isCurved: true,
                            gradient: LinearGradient(
                              colors: gradientColors,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            barWidth: 5,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: gradientColors
                                    .map((color) => color.withOpacity(0.25))
                                    .toList(),
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          ),
                        ],
                      ),

                      swapAnimationDuration:
                          const Duration(milliseconds: 150), // Optional
                      swapAnimationCurve: Curves.linear, // Optional
                    ),
                  ),
                ),
                addVertical(15),
                subText('Categories', fontSize: 16),
                const Divider(thickness: .45),
                addVertical(15),
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                      child: Container(),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Expanded(
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           // setState(() {
                      //           //   showAvg = !showAvg;
                      //           // });
                      //           Navigator.pushNamed(context, '/vendors');
                      //         },
                      //         child: const DashCards(
                      //           title: 'All Vendors',
                      //           subtitle: '',
                      //           image: 'assets/images/vendors.png',
                      //           backgroundColor: PRIMARY_COLOR,
                      //         ),
                      //       ),
                      //     ),
                      //     addHorizontal(10),
                      //     Expanded(
                      //       child: GestureDetector(
                      //         onTap: () =>
                      //             Navigator.pushNamed(context, '/offers'),
                      //         child: const DashCards(
                      //           title: 'All Offers',
                      //           subtitle: '',
                      //           image: 'assets/images/discount.png',
                      //           backgroundColor: SECOND_COLOR,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ],
                ),
                addVertical(size.height * 0.015),
                SizedBox(
                  height: size.height * 0.2,
                  child: Container(),
                  //  Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           // setState(() {
                  //           //   showAvg = !showAvg;
                  //           // });
                  //           Navigator.pushNamed(context, '/vendors');
                  //         },
                  //         child: const DashCards(
                  //           title: 'Top Vendors',
                  //           subtitle: '',
                  //           image: 'assets/images/vendors.png',
                  //           backgroundColor: OFFERS_COLOR,
                  //         ),
                  //       ),
                  //     ),
                  //     addHorizontal(10),
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () => Navigator.pushNamed(context, '/offers'),
                  //         child: const DashCards(
                  //           title: 'Menu',
                  //           subtitle: '',
                  //           image: 'assets/images/menu.png',
                  //           backgroundColor: Colors.green,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
