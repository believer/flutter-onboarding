import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final List<Widget> introduction = <Widget>[
    IntroWidget(title: 'Lorem', body: 'Page one'),
    IntroWidget(title: 'Ipsum', body: 'Page two'),
    IntroWidget(title: 'Lorem ipsum', body: 'Page three'),
  ];

  final pageController = PageController(initialPage: 1);
  int currentPage = 1;

  void getChangedPageAndMove(int page) {
    currentPage = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          physics: ClampingScrollPhysics(),
          controller: pageController,
          onPageChanged: (int page) => getChangedPageAndMove(page),
          itemCount: introduction.length,
          itemBuilder: (context, index) => introduction[index],
        ),
        Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 25),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < introduction.length; i++)
                          if (i == currentPage) ...[circle(true)] else
                            circle(false)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      color: Colors.black12,
                      child: Text("Get started"),
                      padding: EdgeInsets.all(12.0),
                      onPressed: () {
                        // TODO Nope
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  circle(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        color: isActive ? Colors.red : Colors.black26,
      ),
    );
  }
}

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    Key key,
    @required this.body,
    @required this.title,
  }) : super(key: key);

  final String body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.only(bottom: 60.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  height: 1.5,
                ),
              ),
            ),
            Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
