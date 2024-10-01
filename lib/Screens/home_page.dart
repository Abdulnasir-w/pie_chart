import 'package:example/Components/containers.dart';
import 'package:example/Components/drawer.dart';
import 'package:example/Components/pie_chart.dart';
import 'package:example/Components/progress_bar.dart';
import 'package:example/Components/summary_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("DashBoard"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: const CustomNavigationDrawer(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomContainers(
                    containerColor: Colors.cyan,
                    title: 'Customer',
                    value: "150",
                    icon: Icons.shopping_bag,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  CustomContainers(
                    containerColor: Colors.green,
                    title: 'Certifications',
                    value: "53",
                    icon: Icons.bar_chart_outlined,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomContainers(
                    containerColor: Colors.yellow,
                    title: 'Auditors',
                    value: "44",
                    icon: Icons.person,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CustomContainers(
                      containerColor: Colors.red,
                      title: 'In Progress',
                      value: "65",
                      icon: Icons.pie_chart),
                ],
              ),
              SizedBox(
                height: 15,
              ),

              // Summary
              SummaryContainer(title: "Summary", child: PieChart()),
              SizedBox(
                height: 15,
              ),

              // Progress bar
              SummaryContainer(
                title: "Customer Progress",
                child: Column(
                  children: [
                    CustomProgressBar(
                      value: 69,
                      title: 'Nestle Pakistan',
                      valueColor: Colors.blue,
                    ),
                    CustomProgressBar(
                      value: 29,
                      title: 'Descon Engineering',
                      valueColor: Colors.red,
                    ),
                    CustomProgressBar(
                      value: 39,
                      title: 'Ramay Textile',
                      valueColor: Colors.green,
                    ),
                    CustomProgressBar(
                      value: 79,
                      title: 'Hubco Power',
                      valueColor: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
