class Problem {
  final String id;
  final String questionNumber;
  final String level;
  final String problemTitle;
  final String problem;
  final List<TestCase> sampleTestCases;
  final List<TestCase> testCases;
  final bool status;
  final List<String> sampleCode;

  Problem({
    required this.id,
    required this.questionNumber,
    required this.level,
    required this.problemTitle,
    required this.problem,
    required this.sampleTestCases,
    required this.testCases,
    required this.status,
    required this.sampleCode,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      id: json['_id'],
      questionNumber: json['qno'],
      level: json['level'],
      problemTitle: json['problemTitle'],
      problem: json['problem'],
      sampleTestCases: (json['sampleTestCase'] as List)
          .map((testCase) => TestCase.fromJson(testCase))
          .toList(),
      testCases: (json['TestCase'] as List)
          .map((testCase) => TestCase.fromJson(testCase))
          .toList(),
      status: json['status'],
      sampleCode: List<String>.from(json['sampleCode']),
    );
  }
}

class TestCase {
  final String id;
  final String input;
  final String output;

  TestCase({
    required this.id,
    required this.input,
    required this.output,
  });

  factory TestCase.fromJson(Map<String, dynamic> json) {
    return TestCase(
      id: json['_id'],
      input: json['input'],
      output: json['output'],
    );
  }
}