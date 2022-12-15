import 'package:flutter/material.dart';
import 'csgo.dart';
import 'remote_service.dart';

class TeamsPage extends StatefulWidget {
  late int id;
  TeamsPage({super.key,required this.id});
  @override
  _TeamsPage createState() =>  _TeamsPage(id: id);
}


class _TeamsPage extends State<TeamsPage> {
  late int id;
  _TeamsPage({required this.id});
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Player selection"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return  Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          csgo!.players[id].nickname,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ), Text(" "),
                      Text(
                          csgo!.players[id].fullname,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      Text(
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          " "
                      ),
                    ],)
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),),

      ),
    );
  }
}