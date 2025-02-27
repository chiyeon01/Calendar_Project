import 'package:flutter/material.dart';
import 'package:myapp/component/text_field.dart';
import 'package:myapp/const/colors.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  Color SelectedColor = categoryColor[0];
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.white,
      child: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                _Time(
                  onEndSaved: onEndSaved,
                  onEndValidated: onEndValidated,
                  onStartSaved: onStartSaved,
                  onStartValidated: onStartValidated,
                ),
                SizedBox(height: 8.0),
                _Content(
                  onSaved: onContentSaved,
                  onValidated: onContentValidated,
                ),
                SizedBox(height: 8.0),
                _Category(
                  SelectedColor: SelectedColor,
                  onTap: (color) {
                    setState(() {
                      SelectedColor = color;
                    });
                  },
                ),
                SizedBox(height: 8.0),
                _Button(onPressed: onSaved),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onStartSaved(String? val) {
    print(val);
  }

  String? onStartValidated(String? val) {
    if (val == null) {
      return '값을 입력해주세요.';
    }
    if (int.tryParse(val) == null) {
      return '숫자를 입력해주세요.';
    }
    if (int.parse(val) < 0 || int.parse(val) > 24) {
      return '24-25사이의 숫자를 입력해주세요.';
    }
    return null;
  }

  void onEndSaved(String? val) {
    print(val);
  }

  String? onEndValidated(String? val) {
    if (val == null) {
      return '값을 입력해주세요.';
    }
    if (int.tryParse(val) == null) {
      return '숫자를 입력해주세요.';
    }
    if (int.parse(val) < 0 || int.parse(val) > 24) {
      return '24-25사이의 숫자를 입력해주세요.';
    }
    return null;
  }

  void onContentSaved(String? val) {
    print(val);
  }

  String? onContentValidated(String? val) {
    if (val == null) {
      return '내용을 입력해주세요.';
    }
    if (val.length < 5) {
      return '5자리 이상을 입력해주세요.';
    }
    return null;
  }

  onSaved() {
    setState(() {
      final isValid = formkey.currentState?.validate();
      if (isValid!){
        formkey.currentState?.save();
      }
    });
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldValidator<String> onStartValidated;
  final FormFieldSetter<String> onEndSaved;
  final FormFieldValidator<String> onEndValidated;

  const _Time({
    required this.onStartSaved,
    required this.onStartValidated,
    required this.onEndSaved,
    required this.onEndValidated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
            onSaved: onStartSaved,
            validator: onStartValidated,
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: CustomTextField(
            label: '종료 시간',
            onSaved: onEndSaved,
            validator: onEndValidated,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> onValidated;

  const _Content({
    required this.onSaved,
    required this.onValidated,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        onSaved: onSaved,
        validator: onValidated,
        expand: true,
      ),
    );
  }
}

typedef OnSelectColor = void Function(Color color);

class _Category extends StatelessWidget {
  final Color SelectedColor;
  final OnSelectColor onTap;

  const _Category({
    required this.SelectedColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          categoryColor
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    onTap(e);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            SelectedColor == e
                                ? Border.all(color: Colors.grey, width: 3.0)
                                : null,
                        color: e,
                      ),
                      width: 32.0,
                      height: 32.0,
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;

  const _Button({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            onPressed: onPressed,
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}
