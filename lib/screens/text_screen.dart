import 'package:flutter/material.dart';
import 'package:my_util_widget/widgets/custom_text_field.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
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
              },
              validator: contentValidator,
            ),
          ),
        ],
      ),
    );
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
