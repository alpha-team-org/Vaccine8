import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:vaccine8/components/constants/const.dart';

class IntroScreenState extends StatefulWidget {
  @override
  _IntroScreenStateState createState() => _IntroScreenStateState();
}

class _IntroScreenStateState extends State<IntroScreenState> {
  List<Slide> slides = [];

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title:
            "Book a Appointment for COVID-19 Vaccine first dose and second dose.",
        styleTitle: TextStyle(
            color: Color.fromRGBO(42, 42, 192, .7),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Book a Appointment for COVID-19 Vaccine first dose and second dose.",
        styleDescription: TextStyle(
          color: Color.fromRGBO(42, 42, 192, .7),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
        pathImage: "assets/pcr.jpg",
      ),
    );
    slides.add(
      Slide(
        title: "Book a COVID-19 Tests Appointments.",
        styleTitle: TextStyle(
          color: Color.fromRGBO(42, 42, 192, .7),
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description: "Book a COVID-19 Tests Appointments.",
        styleDescription: TextStyle(
          color: Color.fromRGBO(42, 42, 192, .7),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
        pathImage: "assets/vaccine.jpg",
      ),
    );
    slides.add(
      Slide(
        title: "COFFEE SHOP",
        styleTitle: TextStyle(
            color: Color.fromRGBO(42, 42, 192, .7),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
          color: Color.fromRGBO(42, 42, 192, .7),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
        pathImage: "assets/vaccine.jpg",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    this.goToTab(0);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
    print(index);
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color.fromRGBO(42, 42, 192, .7),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, logindRoute),
      child: Icon(
        Icons.done,
        color: Color.fromRGBO(42, 42, 192, .7),
      ),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color.fromRGBO(42, 42, 192, .7),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(
        Color.fromRGBO(42, 42, 192, .1),
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        Color.fromRGBO(42, 42, 192, .7),
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 10.0),
          child: ListView(
            children: <Widget>[
              Image.asset('assets/app_logo.png'),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                // margin: EdgeInsets.only(top: 20.0),
              ),
              // Container(
              //   child: Text(
              //     currentSlide.description,
              //     style: currentSlide.styleDescription,
              //     textAlign: TextAlign.center,
              //     maxLines: 5,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              //   // margin: EdgeInsets.only(top: 1.0),
              // ),
              Container(
                padding: EdgeInsets.only(top: 90),
                child: Image.asset(
                  currentSlide.pathImage,
                  width: 400.0,
                  height: 280.0,
                  fit: BoxFit.contain,
                ),
              ),
              Image.asset('assets/clip.png'),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: Color.fromRGBO(42, 42, 192, .7),
      sizeDot: 13.0,
      // typeDotAnimation: enum dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Color.fromRGBO(236, 241, 250, 1),
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Behavior
      scrollPhysics: BouncingScrollPhysics(),

      // Show or hide status bar
      hideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
