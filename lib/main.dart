import 'package:flutter/material.dart';
import 'remote_service.dart';
import 'csgo.dart';
import 'csgo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lab_3',
      theme: ThemeData(
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}):super (key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int id;
  Topochka? csgo;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }

  getData() async {
    csgo = await RemoteService().getTopochka();
    if(csgo != null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Player selection"),
      ),
      body: Center(
        child: Row(

          children: [
            Container(
              margin: EdgeInsets.fromLTRB(150, 0, 75, 0),
              child:
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TeamsPage(id: 0)));
                },
                child: Text('simpel'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                ),


              ),),
            Container(
              margin: EdgeInsets.fromLTRB(75, 0, 75, 0),child:
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TeamsPage(id: 1)));
              },
              child: Text('elecroNic'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20),),
            ),),
            Container(margin: EdgeInsets.fromLTRB(75, 0, 75, 0),child:
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TeamsPage(id: 2)));
              },
              child: Text('sdy'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20),),
            ),),
            Container(margin: EdgeInsets.fromLTRB(75, 0, 75, 0),child:
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TeamsPage(id: 3)));
              },
              child: Text('Perfecto'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              ),
            )),
            Container(margin: EdgeInsets.fromLTRB(75, 0, 75, 0),child:
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TeamsPage(id: 4)));
              },
              child: Text('b1t'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              ),
            ))
          ],
        ),
      ),);}}
