import 'package:bmi_usama/textfield/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animation/hoveranimatescreen.dart';
import 'buttons/bothbuttons.dart';

void main() {
  Color primaryColor = Colors.blue;
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      home: MyBmi(),
    ),
  );
}

class MyBmi extends StatefulWidget {
  const MyBmi({super.key});

  @override
  State<MyBmi> createState() => _MyBmiState();
}

class _MyBmiState extends State<MyBmi> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmi;
  String category = "";
  String extraMessage = "";

  void reset() {
    setState(() {
      heightController.clear();
      weightController.clear();
      bmi = null;
      category = "";
    });
  }

  void calculate() {
    double? heightCm = double.tryParse(heightController.text.trim());
    double? weightKg = double.tryParse(weightController.text.trim());
    if (heightCm == null || weightKg == null || heightCm <= 0 || weightKg <= 0) {
      setState(() {
        bmi = null;
        category = "❌ Please enter valid values";
      });
      return; // stop execution
    }
    // height in meters

    double heightM = heightCm / 100;


    setState(() {
        bmi = weightKg / (heightM * heightM);
      if (bmi! < 18.5) {
        category = "UnderWeight";
        extraMessage = "⚠️ Eat more nutritious food!";
      }
      else if (bmi! < 24.5) {
        category = "Normal";
        extraMessage = "✅ Keep up the good lifestyle!";
      }
      else if (bmi! < 29.9) {
        category = "Overweight";
        extraMessage = "⚠️ Try regular exercise!";
      }
      else {
        category = "Obese";
        extraMessage = "❌ Consult a doctor for advice!";
      }
    });


  }
  Color getCategoryColor() {
    if (category == "UnderWeight") {
      return Colors.blue;       // halka blue
    } else if (category == "Normal") {
      return Colors.green;      // healthy green
    } else if (category == "Overweight") {
      return Colors.orange;     // orange warning
    } else if (category == "Obese") {
      return Colors.red;        // danger red
    }
    return Colors.black; // default
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(

                children: [
                  SizedBox(height:20,),
                  Text(
                    "BMI CALCULATOR",
                    style: GoogleFonts.bowlbyOne(
                      letterSpacing: 2,
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 8,),
                  TextFormFieldScreen(title: 'Height (cm) : ', hintText: "Enter the Height", controller:  heightController,),
                  SizedBox(height: 16,),
                  TextFormFieldScreen(title: 'Weight (kg) : ', hintText: "Enter the Weight", controller: weightController,),
                 SizedBox(height: 25,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     HoverAnimationScreen(
                       onPressed: calculate,
                       child: ButtonsScreen(
                       onPressed: calculate,
                       child: 'Calculate',),
                     ),
                     HoverAnimationScreen(
                       onPressed: reset,
                       child: ButtonsScreen(
                         onPressed: reset,
                         child: 'Reset',),
                     )
                   ],
                 ),
                  SizedBox(height: 10,),
                  Text(

                    bmi == null
                        ? category.isEmpty ? "" : category
                        : "Your BMI is ${bmi!.toStringAsFixed(2)}  Category: $category\n$extraMessage",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18,color:getCategoryColor()),
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
