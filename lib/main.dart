import 'package:flutter/material.dart';
import 'package:scoped/models/count_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp(model: CounterModel()));
}

class MyApp extends StatelessWidget {
  final CounterModel model;

  const MyApp({Key key, this.model}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
        model: model,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Home(title: 'Ninja id Card'),
        ));
  }
}

class Home extends StatelessWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: FlutterLogo(
                  size: 30.0,
                ),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 90,
              color: Colors.grey[800],
            ),
            Text(
              "Name",
              style: TextStyle(color: Colors.grey[100], letterSpacing: 2.0),
            ),
            SizedBox(height: 20.0),
            Text('Joshua',
                style: TextStyle(
                    color: Colors.amber[300],
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Current Ninja level",
              style: TextStyle(color: Colors.grey[100], letterSpacing: 2.0),
            ),
            SizedBox(height: 20.0),
            ScopedModelDescendant<CounterModel>(
                builder: (context, child, model) {
              return Text(model.counter.toString(),
                  style: TextStyle(
                      color: Colors.amber[300],
                      fontSize: 30.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold));
            }),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Joshwarurii55@gmail.com',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScopedModelDescendant<CounterModel>(builder: (context, child, model) {
                  return FlatButton(
                      color: Colors.blue,
                      onPressed: model.incrementCounter,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ));
                }),
                ScopedModelDescendant<CounterModel>(builder: (context, child, model) {
                  return FlatButton(
                      color: Colors.red,
                      onPressed: model.decrementCounter,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ));
                }),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
