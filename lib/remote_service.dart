import 'csgo.dart';
import 'package:http/http.dart' as http;

class RemoteService{

  Future<Topochka?> getTopochka() async{
    var client = http.Client();
    var uri = Uri.parse('https://hltv-api.vercel.app/api/teams.json');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json =response.body;
      return topochkaFromJson(json);
    }
  }
}