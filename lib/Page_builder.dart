import 'package:assignment_coreteams/Screens/GenderClass.dart';
import 'package:assignment_coreteams/Screens/HeightClass.dart';
import 'package:assignment_coreteams/Screens/WeightClass.dart';
import 'package:flutter/material.dart';

class PageBuilderClass extends StatefulWidget {
  const PageBuilderClass({super.key});

  @override
  State<PageBuilderClass> createState() => _PageBuilderClassState();
}

class _PageBuilderClassState extends State<PageBuilderClass> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override 
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('Skip'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05, ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: MediaQuery.of(context).size.height * 0.005,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIndicatorSegment(0),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                _buildIndicatorSegment(1),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                _buildIndicatorSegment(2),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                GenderClass(onGenderSelected: (String gender) {
                  setState(() {
                    selectedGender = gender;
                  });
                }),
                HeightClass(),
                WeightClass(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_currentPage == 0 && selectedGender == null) {
                _showSelectGenderDialog();
              } else if (_currentPage < 2) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(margin: EdgeInsets.all(1),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Color(0xff522ED2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: CircularProgressIndicator(
                    value: (_currentPage + 1) / 3,
                    strokeWidth: 4,
                    color: Color(0xff522ED2),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildIndicatorSegment(int index) {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _currentPage >= index ? Colors.purple : Colors.grey[300],
        ),
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

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
}
