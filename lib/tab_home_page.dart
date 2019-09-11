import 'package:flutter/material.dart';

import 'second-page.dart';

class HomeWidth extends StatefulWidget {
  @override
  _HomeWidthState createState() => _HomeWidthState();
}

class _HomeWidthState extends State<HomeWidth> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    _tapButton() {
      setState(() {
        isLoading = !isLoading;
      });
    }

    return Container(
      color: Colors.grey[400],
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Segunda página"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return SecondPage();
              }));
            },
          ),
          RaisedButton(
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
              var snackbar = SnackBar(
                content: Text("Snack top!!!!!"),
              );

              Scaffold.of(context).showSnackBar(snackbar);
            },
            child: Text("Abrindo snackBar"),
          ),
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Conteudo do alerta"),
                      title: Text("Titulo do alerta"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            },
            child: Text("Abrir modal"),
          ),
          GestureDetector(
            onTap: _tapButton,
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(isLoading ? 30 : 10)),
              width: isLoading ? 50 : 200,
              height: 50,
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 0),
                firstChild: Center(
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                secondChild: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
                crossFadeState: isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                reverseDuration: Duration(milliseconds: 800),
              ),
            ),
          ),
          ClipOval(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          ClipRect(
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
            clipBehavior: Clip.hardEdge,
          ),
          ClipPath(
            child: Container(
              color: Colors.green,
              width: 100,
              height: 100,
            ),
            clipper: ClipPathCustom(),
          )
        ],
      ),
    );
  }
}

class ClipPathCustom extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
