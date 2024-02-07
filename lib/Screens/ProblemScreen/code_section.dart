import 'package:code_school/Screens/ProblemScreen/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import '../../Models/problem_model.dart';
import 'bloc/Compiler/compiler_bloc.dart';
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
  final String? _code = _defaultCode;
  final bool _showNumbers = true;
  final bool _showErrors = true;
  final bool _showFoldingHandles = true;
  final _codeFieldFocusNode = FocusNode();
  late final _codeController = CodeController(
    language: builtinLanguages[_language],
    namedSectionParser: const BracketsStartEndNamedSectionParser(),
    text: _code,
  );

  @override
  Widget build(BuildContext context) {
    return
   BlocListener<CompilerBloc, CompilerState>(
  listener: (context, state) {
    if (state is CompilerSubmitState) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible:true,
        builder: (BuildContext context) {
          return const  Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    } else if (state is CompilerDone) {
      Navigator.of(context).pop();
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return Container(
            height:MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               //  Text("data"),
               //  Text(state.testCases.isEmpty?"Empty":"Not Empty ${state.testCaseResults.length}"),
               //  Text(state.testCases[0].output),
               // Text(state.testCaseResults.isEmpty?"Empty":"Not Empty ${state.testCaseResults.length}"),
               //  Text(state.testCases[0].input),
                (state.testCaseResults.isEmpty&& state.testCaseResults.isEmpty)? Container(
                  child: Text("Failed to compile"),
                )
                :Expanded(
                  child: ListView.builder(
                    itemCount: state.testCases.length,
                    itemBuilder: (context, index) {
                      return index >= 0
                          ? ListTile(
                        title: Text(state.testCases[index].input),
                        subtitle: Text(state.testCases[index].output),
                        trailing: state.testCaseResults[index]
                            ? const Icon(Icons.check, color: Colors.green)
                            : const Icon(Icons.close, color: Colors.red),
                      )
                          : const SizedBox();
                    },
                  ),
                ),

              ],
            ),
          );
        },
      );
    } else if (state is CompilerError) {
      Navigator.of(context).pop();
      showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Center(
            child: Text(state.message),
          );
        },
      );
    }
  },
  child: Scaffold(
      backgroundColor: themes[_theme]?['root']?.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [

        Expanded(
            flex: 1,
            child: Row(
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_codeController.text);
          BlocProvider.of<CompilerBloc>(context).add(CompilerSubmit(problem: widget.problem,language: _language,code:_codeController.text));


        },
        child: const Icon(Icons.send),
      ),
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
      _codeController.text =codeSnippets[value]!;
      _codeFieldFocusNode.requestFocus();
    });
  }


  void _setTheme(String value) {
    setState(() {
      _theme = value;
      _codeFieldFocusNode.requestFocus();
    });
  }
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<CompilerBloc>(context).stream.listen((state) {
    //   if (state is CompilerSubmitState) {
    //     showModalBottomSheet(
    //       context: context,
    //       isDismissible: true,
    //       builder: (BuildContext context) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       },
    //     );
    //   }
    //   if (state is CompilerDone) {
    //     showModalBottomSheet(
    //       context: context,
    //       isDismissible: true,
    //       builder: (BuildContext context) {
    //         return SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               Expanded(
    //                 child: ListView.builder(
    //                   itemCount: state.testCases.length,
    //                   itemBuilder: (context, index) {
    //                     return index > 0
    //                         ? ListTile(
    //                            title: Text(state.testCases[index].input),
    //                             subtitle: Text(state.testCases[index].output),
    //                              trailing: state.testCaseResults[index]
    //                           ? const Icon(Icons.check, color: Colors.green)
    //                           : const Icon(Icons.close, color: Colors.red),
    //                     )
    //                         : const SizedBox();
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     );
    //   }
    //   if (state is CompilerError) {
    //     showModalBottomSheet(
    //       context: context,
    //       isDismissible: true,
    //       builder: (BuildContext context) {
    //         return Center(
    //           child: Text(state.message),
    //         );
    //       },
    //     );
    //   }
    // });
  }

}
