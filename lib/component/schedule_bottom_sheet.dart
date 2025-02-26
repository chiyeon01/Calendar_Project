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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.white,
      child: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Column(
            children: [
              _Time(),
              SizedBox(
                height: 8.0,
              ),
              _Content(),
              SizedBox(
                height: 8.0,
              ),
              _Category(
                SelectedColor: SelectedColor,
                onTap: (color){
                  setState(() {
                    SelectedColor = color;
                  });
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              _Button(),
            ],
          ),
        ),
      )
    );
  }

}

class _Time extends StatelessWidget {
  const _Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: CustomTextField(
            label: '종료 시간',
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        expand: true
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
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categoryColor.map(
        (e) => GestureDetector(
          onTap: (){
            onTap(e);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 8.0),
              child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: SelectedColor == e ? Border.all(
                  color: Colors.grey,
                  width: 3.0,
                ): null,
                color: e
              ),
              width: 32.0,
              height: 32.0,
            )
          ),
        )
      ).toList()
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

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
            onPressed: (){},
            child: Text('저장')
          ),   
        ),
      ],
    );
  }
}