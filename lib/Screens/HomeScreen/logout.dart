import 'package:hive/hive.dart';

void logoutM()async{
  try{
    var box = await Hive.openBox('jwt');
    var item=box.values.toList();
    // print(item[0].jwt);
    // box.delete(item);
    print("token : ${item[0].jwt}");
    Hive.box('jwt').clear();
    print("token : ${item[0].jwt}");

  }catch(error){
    throw Exception('response: ${error}');
  }
}