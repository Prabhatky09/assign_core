import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenderClass extends StatefulWidget {
  final Function(String gender) onGenderSelected;

  const GenderClass({super.key, required this.onGenderSelected});

  @override
  State<GenderClass> createState() => _GenderClassState();
}

class _GenderClassState extends State<GenderClass> {
  String? selectedGender;

  void _showSelectGenderDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selection Needed'),
          content: Text('Please select a gender to continue.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,),
              Text(
                'Select Your Gender',
                style: TextStyle(
                  color: Color(0xff4E4866),
                  fontSize: MediaQuery.of(context).size.height * 0.020,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Help Us To personalize your Plan',
                style: TextStyle(
                  color: Color(0xff626C72),
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Radio(
                        value: 'female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                            widget.onGenderSelected(selectedGender!); 
                          });
                        },
                      ),
                      SvgPicture.asset('assets/pic/Group 1 (1).svg'),
                      Text('Female')
                    ],
                  ),
                  Column(
                    children: [
                      Radio(
                        value: 'male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                            widget.onGenderSelected(selectedGender!); 
                          });
                        },
                      ),
                      SvgPicture.asset('assets/pic/Group 2 (1).svg'),
                      Text('Male')
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = 'other';
                    widget.onGenderSelected(selectedGender!); 
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: const Color(0xffE9E9E9)),
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: const Center(child: Text('Other')),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: const Color(0xffF1F4F8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'female';
                          widget.onGenderSelected(selectedGender!); 
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: selectedGender == 'female'
                              ? const Color(0xff522ED2)
                              : const Color(0xffF1F4F8),
                        ),
                        child: Center(
                          child: Text(
                            'Female',
                            style: TextStyle(
                              color: selectedGender == 'female'
                                  ? Colors.white
                                  : Color(0xff979797),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                          ),
                        ),
                      ),
                    ),
                  
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'male';
                          widget.onGenderSelected(selectedGender!); 
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: selectedGender == 'male'
                              ? const Color(0xff522ED2)
                              : const Color(0xffF1F4F8),
                        ),
                        child: Center(
                          child: Text(
                            'Male',
                            style: TextStyle(
                              color: selectedGender == 'male'
                                  ? Colors.white
                                  : Color(0xff979797),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'other';
                          widget.onGenderSelected(selectedGender!);
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: selectedGender == 'other'
                              ? const Color(0xff522ED2)
                              : const Color(0xffF1F4F8),
                        ),
                        child: Center(
                          child: Text(
                            'Other',
                            style: TextStyle(
                              color: selectedGender == 'other'
                                  ? Colors.white
                                  : Color(0xff979797),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                          ),
                        ),
                      ),
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
