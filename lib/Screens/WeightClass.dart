import 'package:flutter/material.dart';
class WeightClass extends StatefulWidget {
  const WeightClass({super.key});

  @override
  State<WeightClass> createState() => _WeightClassState();
}

class _WeightClassState extends State<WeightClass> {

  double gaugeValue =130;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            'Select Your Weight?',
            style: TextStyle(
              color: const Color(0xff4E4866),
              fontSize: MediaQuery.of(context).size.height * 0.020,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Help Us To personalize your Plan',
            style: TextStyle(
              color: const Color(0xff626C72),
              fontSize: MediaQuery.of(context).size.height * 0.015,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color(0xffF1F4F8),
            ),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.34,
                  decoration: BoxDecoration(
                      color: const Color(0xff522ED2),
                      borderRadius: BorderRadius.circular(60)),
                  child: Center(child: Text('Kg')),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.34,
                  decoration: BoxDecoration(
                      // color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(60)),
                  child: Center(child: Text('Lbs')),
                )
              ],
            ),
          ), 
      


          // AnimatedRadialGauge(axis: GaugeAxis(progressBar: GaugeProgressBar.rounded(color: Colors.blue),degrees: 180,max:115,min: 80,pointer: NeedlePointer(width: 5, height: 10) ),duration: Duration(seconds: 1), value: 2)
        ],
      )),
    );
  }
}
