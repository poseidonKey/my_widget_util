import 'package:flutter/material.dart';
import 'package:my_util_widget/const/colors.dart';
import 'package:my_util_widget/widgets/custom_elevated_button.dart';
import 'package:my_util_widget/widgets/custom_text_field.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime; // 시작 시간 저장 변수
  int? endTime; // 종료 시간 저장 변수
  String? content; // 일정 내용 저장 변수

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Form(
        // ➊ 텍스트 필드를 한 번에 관리할 수 있는 폼
        key: formKey, // ➋ Form을 조작할 키값
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height / 2 +
                bottomInset, // ➋ 화면 반 높이에 키보드 높이 추가하기
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 8, right: 8, top: 8, bottom: bottomInset),
              child: Column(
                // ➋ 시간 관련 텍스트 필드와 내용관련 텍스트 필드 세로로 배치
                children: [
                  Row(
                    // ➊ 시작 시간 종료 시간 가로로 배치
                    children: [
                      Expanded(
                        child: CustomTextField(
                          // 시작시간 입력 필드
                          label: '시작 시간',
                          isTime: true,
                          onSaved: (String? val) {
                            // 저장이 실행되면 startTime 변수에 텍스트 필드 값 저장
                            startTime = int.parse(val!);
                          },
                          validator: timeValidator,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: CustomTextField(
                          // 종료시간 입력 필드
                          label: '종료 시간',
                          isTime: true,
                          onSaved: (String? val) {
                            // 저장이 실행되면 endTime 변수에 텍스트 필드 값 저장
                            endTime = int.parse(val!);
                          },
                          validator: timeValidator,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: CustomTextField(
                      // 내용 입력 필드
                      label: '내용',
                      isTime: false,
                      onSaved: (String? val) {
                        // 저장이 실행되면 content 변수에 텍스트 필드 값 저장
                        content = val;
                      },
                      validator: contentValidator,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const _ColorPicker(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      // [저장] 버튼
                      // ➌ [저장] 버튼
                      onPressed: () => onSavePressed(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PRIMARY_COLOR,
                      ),
                      child: const Text('저장'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        label: 'Back!!',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      // ➊ 폼 검증하기
      formKey.currentState!.save(); // ➋ 폼 저장하기

      Navigator.of(context).pop();
    }
  }

  String? timeValidator(String? val) {
    if (val == null) {
      return '값을 입력해주세요';
    }

    int? number;

    try {
      number = int.parse(val);
    } catch (e) {
      return '숫자를 입력해주세요';
    }

    if (number < 0 || number > 24) {
      return '0시부터 24시 사이를 입력해주세요';
    }

    return null;
  } // 시간값 검증

  String? contentValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '값을 입력해주세요';
    }

    return null;
  } // 내용값 검증
}

final class _ColorPicker extends StatelessWidget {
  const _ColorPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: [
        renderColor(color: Colors.red),
        renderColor(color: Colors.orange),
        renderColor(color: Colors.yellow),
        renderColor(color: Colors.green),
        renderColor(color: Colors.indigo),
        renderColor(color: Colors.deepPurple),
        renderColor(color: Colors.blue),
      ],
    );
  }

  Widget renderColor({
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: 32,
      height: 32,
    );
  }
}
