import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart'; 
 
class ReportScreen extends StatefulWidget { 
const ReportScreen({Key? key}) : super(key: key); 

@override 
State<ReportScreen> createState() => _ReportScreenState(); 
} 

class _ReportScreenState extends State<ReportScreen> { 
// Data for the pie chart 
Map<String, double> dataMap = { 
	"babies": 18.47, 
	"teenagers": 17.70, 
	"seniors": 4.25, 
}; 

// Colors for each segment 
// of the pie chart 
List<Color> colorList = [ 
	const Color(0xffD95AF3), 
	const Color(0xff3EE094), 
	const Color(0xff3398F6), 
	const Color(0xffFA4A42), 
	const Color(0xffFE9539) 
]; 

// List of gradients for the 
// background of the pie chart 
final gradientList = <List<Color>>[ 
	[ 
	Color.fromRGBO(223, 250, 92, 1), 
	Color.fromRGBO(129, 250, 112, 1), 
	], 
	[ 
	Color.fromRGBO(129, 182, 205, 1), 
	Color.fromRGBO(91, 253, 199, 1), 
	], 
	[ 
	Color.fromRGBO(175, 63, 62, 1.0), 
	Color.fromRGBO(254, 154, 92, 1), 
	] 
]; 

@override 
Widget build(BuildContext context) { 
    return Scaffold( 
	appBar: AppBar( 
		title: const Text("Reports"), 
	), 
	body: Center( 
		child: PieChart(   
		// Pass in the data for 
		// the pie chart 
		dataMap: dataMap, 
		// Set the colors for the 
		// pie chart segments 
		colorList: colorList, 
		// Set the radius of the pie chart 
		chartRadius: MediaQuery.of(context).size.width / 2, 
		// Set the center text of the pie chart 
		centerText: "vaxplus", 
		// Set the width of the 
		// ring around the pie chart 
		ringStrokeWidth: 24, 
		// Set the animation duration of the pie chart 
		animationDuration: const Duration(seconds: 3), 
		// Set the options for the chart values (e.g. show percentages, etc.) 
		chartValuesOptions: const ChartValuesOptions( 
			showChartValues: true, 
			showChartValuesOutside: true, 
			showChartValuesInPercentage: true, 
			showChartValueBackground: false), 
		// Set the options for the legend of the pie chart 
		gradientList: gradientList, 
		), 
	),  
	); 
} 
}
