import 'package:code_school/Screens/ProblemScreen/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import '../../Models/problem_model.dart';
import 'dropdown_selector.dart';
import 'snippets.dart';
import 'package:code_school/Constants/const.dart';

const _defaultLanguage = 'java';
const _defaultTheme = 'monokai-sublime';
var _defaultCode = codeSnippets['java'];
const _defaultAnalyzer = DefaultLocalAnalyzer();
final _dartAnalyzer = DartPadAnalyzer();

const toggleButtonColor = Color.fromARGB(124, 255, 255, 255);
const toggleButtonActiveColor = Colors.white;

final _analyzers = [_defaultAnalyzer, _dartAnalyzer];


class CodeScreen extends StatefulWidget {
  final Problem problem;
  const CodeScreen({required this.problem,super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  String _language = _defaultLanguage;
  String _theme = _defaultTheme;
  String? _code = _defaultCode;
  AbstractAnalyzer _analyzer = _defaultAnalyzer;
  bool _showNumbers = true;
  bool _showErrors = true;
  bool _showFoldingHandles = true;
  final _codeFieldFocusNode = FocusNode();
  late final _codeController = CodeController(
    language: builtinLanguages[_language],
    namedSectionParser: const BracketsStartEndNamedSectionParser(),
    text: _code,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes[_theme]?['root']?.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [

        Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownSelector(
              onChanged: _setLanguage,
              icon: Icons.code,
              value: _language,
              values: languageList,
            ),


            const SizedBox(width: 20),
            DropdownSelector(
              onChanged: _setTheme,
              icon: Icons.color_lens,
              value: _theme,
              values: themeList,
            ),

            const SizedBox(width: 20),
          ],
        ))
        ],
      ),
      body: ListView(
        children: [
          CodeTheme(
            data: CodeThemeData(styles: themes[_theme]),
            child: CodeField(
              focusNode: _codeFieldFocusNode,
              controller: _codeController,
              textStyle: const TextStyle(fontFamily: 'SourceCode'),
              gutterStyle: GutterStyle(
                textStyle: const TextStyle(
                  color: Colors.purple,
                ),
                showLineNumbers: _showNumbers,
                showErrors: _showErrors,
                showFoldingHandles: _showFoldingHandles,
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _codeController.dispose();
    _codeFieldFocusNode.dispose();

    for (final analyzer in _analyzers) {
      analyzer.dispose();
    }

    super.dispose();
  }

  void _setLanguage(String value) {
    setState(() {
      _language = value;
      _codeController.language = builtinLanguages[value];
      _analyzer = _defaultAnalyzer;
      _codeController.text =codeSnippets[value]!;
      _codeFieldFocusNode.requestFocus();
    });
  }

  void _setAnalyzer(AbstractAnalyzer value) {
    setState(() {
      _codeController.analyzer = value;
      _analyzer = value;
    });
  }

  void _setTheme(String value) {
    setState(() {
      _theme = value;
      _codeFieldFocusNode.requestFocus();
    });
  }
}
