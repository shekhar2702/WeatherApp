import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Services{
var lat;
var lon;
var response;
Services({this.lat,this.lon});
Future<dynamic> getReq() async {
var url='https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=0424e3961400f6616403ca53892cb96b';
response=await http.get(url);
try{
var temp=convert.jsonDecode(response.body)['main']['temp'];
var name=convert.jsonDecode(response.body)['name'];
return ([(temp-273).toStringAsFixed(1),name]);
}
catch(e){
  print("error");
  return response.statusCode;
}
}
}