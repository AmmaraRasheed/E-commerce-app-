import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ExpandableView extends StatefulWidget {
  ExpandedView expandedView = new ExpandedView();
  @override
  ExpandedView createState() => expandedView;
}
class ExpandedView extends State<ExpandableView>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  bool isTaped = false;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(
      new CurvedAnimation(
        parent: controller,
        curve: new Interval(
          0.000,
          0.800,
          curve: Curves.linear,
        ),
      ),
    )..addListener(() {
      setState(() {
        // the state that has changed here is the animation object’s value
      });
    });
  }

  void tappedEvent() {
    if (!isTaped) {
      controller.forward();
      isTaped = !isTaped;
    } else {
      controller.reverse();
      isTaped = !isTaped;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return new GestureDetector(
      child: new Material(
        elevation: 50.01,
        color: Colors.transparent,
        child: ClipPath(
          clipper: ArcClipper(),
          child: new Container(
            height: animation.value,
            decoration: new BoxDecoration(
                color: Colors.cyan[900],
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.cyan[800], Colors.cyan[500]],
                  tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
                ),
                borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(animation.value / 10))
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Row(

                children: <Widget>[
                  Container(
                    width: width/2-40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'E-Commerce App',
                          style: new TextStyle(
                              color: Colors.cyan[100],
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Ecommerce is a also known as electronic commerce or internet commerce, refers to the buying and selling of goods or services using the internet, and the transfer of money and data to execute these transactions.",
                            textAlign: TextAlign.justify,
                            style: new TextStyle(

                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(

                    children: <Widget>[
                      Image.asset("asset/frock8.png"),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        tappedEvent();
      },
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);
    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}