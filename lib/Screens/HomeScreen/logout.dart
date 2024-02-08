import 'package:hive/hive.dart';

void logoutM()async{
  try{
    // var box = await Hive.openBox('jwt');
    // var item=box.values.toList();
    // print("token : ${item[0].jwt}");
    // Hive.box('jwt').clear();
    // print("token : ${item[0].jwt}");
    var box=await Hive.openBox('jwt');
    var b=Hive.box('jwt');
    b.deleteAll(b.keys);
    print(b.values);
    print(b.keys);

  }catch(error){
    throw Exception('response: ${error}');
  }
}