import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:syncfusion_flutter_gauges/gauges.dart';

class HeightClass extends StatefulWidget {
  const HeightClass({super.key});

  @override
  State<HeightClass> createState() => _HeightClassState();
}

class _HeightClassState extends State<HeightClass> {
  int selectedHeight = 150; // Default height (in cm)
  final List<int> heights = List<int>.generate(151, (index) => 100 + index);
  //double _currentHeight = 165;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            'Select Your Height?',
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.34,
            decoration: BoxDecoration(
                color: const Color(0xff522ED2),
                borderRadius: BorderRadius.circular(60)),
            child: const Center(
                child: Text(
              'Cm',
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 10.04),
            )),
          ),SizedBox(height:  MediaQuery.of(context).size.height * 0.05,),
          SvgPicture.asset('assets/pic/Group.svg'),
         
          //SfLinearGauge(animateAxis: true,minimum: 145,maximum: 190,)
        ]),
      ),
    );
  }
}
