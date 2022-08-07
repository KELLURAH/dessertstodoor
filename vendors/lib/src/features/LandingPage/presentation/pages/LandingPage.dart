import 'package:data_table_2/data_table_2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors/core/components/DashboardCard.dart';

import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';
import '../../../../../Generic/Sidebar.dart';

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
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              size: 35,
              color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        elevation: 0.25,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                // setState(() {
                //   showAvg = !showAvg;
                // });
                Navigator.pushNamed(context, '/notifications');
              },
              child: Image.asset('assets/images/bell.png', height: 30),
            ),
          ),
        ],
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
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width,
                  child: const DashboardCards(
                    icon: Icon(Icons.today_outlined, size: 35),
                    title: 'Today\'s Orders',
                    subtitle: '7',
                    fontSize: 15,
                  ),
                ),
                addVertical(size.height * 0.0005),
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width,
                  child: const DashboardCards(
                    icon: Icon(Icons.abc, size: 35),
                    title: 'Offers Procured',
                    subtitle: '45',
                    fontSize: 15,
                  ),
                ),
                addVertical(size.height * 0.0005),
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width,
                  child: const DashboardCards(
                    icon: Icon(Icons.abc, size: 35),
                    title: 'Total Orders',
                    subtitle: '15',
                  ),
                ),
                addVertical(size.height * 0.035),
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
                    // child: LineChart(
                    //   LineChartData(
                    //     gridData: FlGridData(
                    //       show: true,
                    //       drawVerticalLine: true,
                    //       horizontalInterval: 1,
                    //       verticalInterval: 1,
                    //       getDrawingHorizontalLine: (value) {
                    //         return FlLine(
                    //           color: const Color(0xff37434d),
                    //           strokeWidth: 1,
                    //         );
                    //       },
                    //       getDrawingVerticalLine: (value) {
                    //         return FlLine(
                    //           color: const Color(0xff37434d),
                    //           strokeWidth: 1,
                    //         );
                    //       },
                    //     ),
                    //     titlesData: FlTitlesData(
                    //       show: true,
                    //       rightTitles: AxisTitles(
                    //         sideTitles: SideTitles(showTitles: false),
                    //       ),
                    //       topTitles: AxisTitles(
                    //         sideTitles: SideTitles(showTitles: false),
                    //       ),
                    //       bottomTitles: AxisTitles(
                    //         sideTitles: SideTitles(
                    //           showTitles: true,
                    //           reservedSize: 30,
                    //           interval: 1,
                    //           // getTitlesWidget: bottomTitleWidgets,
                    //         ),
                    //       ),
                    //       leftTitles: AxisTitles(
                    //         sideTitles: SideTitles(
                    //           showTitles: true,
                    //           interval: 1,
                    //           // getTitlesWidget: leftTitleWidgets,
                    //           reservedSize: 42,
                    //         ),
                    //       ),
                    //     ),
                    //     borderData: FlBorderData(
                    //         show: true,
                    //         border: Border.all(
                    //             color: const Color(0xff37434d), width: 1)),
                    //     minX: 0,
                    //     maxX: 7,
                    //     minY: 0,
                    //     maxY: 4,
                    //     lineBarsData: [
                    //       LineChartBarData(
                    //         spots: const [
                    //           FlSpot(0, 3),
                    //           FlSpot(2.6, 2),
                    //           FlSpot(4.9, 4),
                    //           FlSpot(6.8, 3),
                    //           FlSpot(7, 4.2),
                    //         ],
                    //         isCurved: true,
                    //         gradient: LinearGradient(
                    //           colors: gradientColors,
                    //           begin: Alignment.centerLeft,
                    //           end: Alignment.centerRight,
                    //         ),
                    //         barWidth: 5,
                    //         isStrokeCapRound: true,
                    //         dotData: FlDotData(
                    //           show: false,
                    //         ),
                    //         belowBarData: BarAreaData(
                    //           show: true,
                    //           gradient: LinearGradient(
                    //             colors: gradientColors
                    //                 .map((color) => color.withOpacity(0.25))
                    //                 .toList(),
                    //             begin: Alignment.centerLeft,
                    //             end: Alignment.centerRight,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),

                    //   swapAnimationDuration:
                    //       const Duration(milliseconds: 150), // Optional
                    //   swapAnimationCurve: Curves.linear, // Optional
                    // ),
                    child: BarChart(
                      BarChartData(
                        backgroundColor: SECOND_COLOR.withOpacity(0.25),
                        borderData: FlBorderData(),
                        barGroups: [
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                toY: 3,
                                color: SECOND_COLOR,
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: 5,
                                color: SECOND_COLOR,
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                toY: 8,
                                color: SECOND_COLOR,
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 4,
                                color: SECOND_COLOR,
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                toY: 4,
                                color: SECOND_COLOR,
                                width: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                      swapAnimationDuration:
                          const Duration(milliseconds: 150), // Optional
                      swapAnimationCurve: Curves.linear, // Optional
                    ),
                  ),
                ),
                addVertical(size.height * 0.035),
                subText('Most Recent Orders', fontSize: 16),
                const Divider(),
                addVertical(10),
                Container(
                  height: 250,
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: const [
                      DataColumn2(
                        label: Text('Column A'),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('Column B'),
                      ),
                      DataColumn(
                        label: Text('Column C'),
                      ),
                      DataColumn(
                        label: Text('Column D'),
                      ),
                      DataColumn(
                        label: Text('Column NUMBERS'),
                        numeric: true,
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      100,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('A' * (10 - index % 10))),
                          DataCell(Text('B' * (10 - (index + 5) % 10))),
                          DataCell(Text('C' * (15 - (index + 5) % 10))),
                          DataCell(Text('D' * (15 - (index + 10) % 10))),
                          DataCell(Text(((index + 0.1) * 25.4).toString()))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
