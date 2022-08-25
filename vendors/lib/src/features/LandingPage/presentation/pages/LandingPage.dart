import 'package:data_table_2/data_table_2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Generic/Sidebar.dart';
import '../../../../../core/components/DashboardCard.dart';
import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';

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
    // List<Color> gradientColors = [
    //   PRIMARY_COLOR,
    //   OFFERS_COLOR,
    //   SECOND_COLOR,
    //   Colors.green.withOpacity(0.1)
    // ];

    // bool showAvg = false;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Sidebar(name: widget.name, email: widget.email, context: context),
      appBar: AppBar(
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [SECOND_COLOR, PRIMARY_COLOR],
        //       stops: [0.5, 1.0],
        //       end: Alignment.bottomRight,
        //       begin: Alignment.topLeft,
        //     ),
        //   ),
        // ),
        // backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              size: 35,
              // color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        elevation: 0.25,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(
            // color: Colors.black,
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
          decoration: const BoxDecoration(),
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
                addVertical(size.height * 0.0090),
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width,
                  child: DashboardCards(
                    icon: Image.asset('assets/images/discount.png'),
                    title: 'Offers Procured',
                    subtitle: '45',
                    fontSize: 15,
                  ),
                ),
                addVertical(size.height * 0.0090),
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width,
                  child: DashboardCards(
                    icon: Image.asset('assets/images/all.png'),
                    title: 'Total Orders',
                    subtitle: '15',
                  ),
                ),
                addVertical(size.height * 0.035),
                subText('Summary'),
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 250,
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      // color: Colors.white,
                    ),
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
                                // color: ThemeMode.dark != true
                                // ? Colors.grey[400]
                                // : PRIMARY_COLOR,
                                // gradient: const LinearGradient(
                                // colors: [PRIMARY_COLOR, Colors.white70],
                                // ),
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: 5,
                                // color: ThemeMode.dark != true
                                // ? Colors.grey[400]
                                // : PRIMARY_COLOR,
                                // gradient: const LinearGradient(
                                // colors: [PRIMARY_COLOR, Colors.white70],
                                // ),
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                toY: 8,
                                // color: ThemeMode.dark != true
                                // ? Colors.grey[400]
                                // : PRIMARY_COLOR,
                                // gradient: const LinearGradient(
                                // colors: [PRIMARY_COLOR, Colors.white70],
                                // ),
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 4,
                                // color: ThemeMode.dark != true
                                // ? Colors.grey[400]
                                // : PRIMARY_COLOR,
                                // gradient: const LinearGradient(
                                // colors: [PRIMARY_COLOR, Colors.white70],
                                // ),
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                toY: 6,
                                // color: ThemeMode.dark != true
                                // ? Colors.grey[400]
                                // : PRIMARY_COLOR,
                                // gradient: const LinearGradient(
                                // colors: [PRIMARY_COLOR, Colors.white70],
                                // ),
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                toY: 6,
                                // color: ThemeMode.dark != true
                                // ? Colors.grey[400]
                                // : PRIMARY_COLOR,
                                // gradient: const LinearGradient(
                                // colors: [PRIMARY_COLOR, Colors.white70],
                                // ),
                                width: 25,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 7,
                            barRods: [
                              BarChartRodData(
                                toY: 2,
                                // color: ThemeMode.dark == true
                                //     ? Colors.grey[400]
                                //     : PRIMARY_COLOR,
                                // gradient: const LinearGradient(
                                // colors: [PRIMARY_COLOR, Colors.white70],
                                // ),
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
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                  height: size.height * 0.35,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 250,
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      // color: Colors.white,
                    ),
                    child: DataTable2(
                      columnSpacing: 10,
                      horizontalMargin: 12,
                      minWidth: 600,
                      columns: [
                        DataColumn2(
                          label: subText('Order Number', fontSize: 14),
                          size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: subText('Customer Name', fontSize: 14),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: subText('Order Date', fontSize: 14),
                          size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: subText('Due Date', fontSize: 14),
                          size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: subText('No. of Items', fontSize: 14),
                          size: ColumnSize.M,
                          numeric: true,
                        ),
                        // DataColumn(
                        //   label: Text('Column NUMBERS'),
                        //   numeric: true,
                        // ),
                      ],
                      rows: List<DataRow>.generate(
                        10,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text('A' * (10 - index % 10))),
                            DataCell(Text('B' * (10 - (index + 5) % 10))),
                            DataCell(Text(
                                '${DateTime.now().subtract(Duration(days: 10 - index % 30))}')),
                            DataCell(Text(
                                '${DateTime.now().subtract(Duration(days: index))}')),
                            DataCell(
                              subTextRaleway(
                                ((index + 1) * 25).toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                addVertical(size.height * 0.0325),
                subText('')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
