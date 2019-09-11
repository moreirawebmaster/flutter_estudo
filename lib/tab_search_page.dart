import 'package:flutter/material.dart';
import 'search/search-component.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchComponent, SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animationLogo;
  Animation<double> animationEmail;
  Animation<double> animationPassword;
  Animation<double> animationButton;
  double pageWidh;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 600), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pageWidh = MediaQuery.of(context).size.width;
    animationLogo = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(curve: Curves.easeInCubic, parent: _controller),
    );
    animationEmail = Tween<double>(begin: 0.0, end: pageWidh).animate(_controller);
    animationPassword = Tween<double>(begin: 0.0, end: -pageWidh).animate(_controller);
    animationButton = Tween<double>(begin: pageWidh, end: 50.0).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: _controller,
            child: logo(),
            builder: (BuildContext context, Widget child) {
              return Opacity(
                child: child,
                opacity: animationLogo.value,
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          AnimatedBuilder(
            animation: _controller,
            child: emailField(),
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(animationEmail.value, 0),
                child: child,
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          AnimatedBuilder(
            animation: _controller,
            child: passwordField(),
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                child: child,
                offset: Offset(animationPassword.value, 0),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return buttonAction(
                  onTap: () {
                    if (_controller.isCompleted) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                  width: animationButton.value,
                  isLoading: animationButton.value == 50.0,
                  radius: animationButton.value == 50.0 ? 50 : 8);
            },
          ),
        ],
      ),
    );
  }
}
