import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/php.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/scala.dart';



String authUrl="http://192.168.1.118:3000/api/v1/auth";
String problemUrl="http://192.168.1.118:3000/api/v1/problem";
String compileUrl="http://192.168.1.118:3000/api/v1/problem/complie";

const languageList = <String>[
  'java',
  'cpp',
  'python'
];

const themeList = <String>[
  'a11y-dark',
  'an-old-hope',
  'atom-one-dark',
  'monokai-sublime',
  'vs',
  'vs2015',
];
final builtinLanguages = {
  'java': java,
  'cpp': cpp,
  'python': python
};

