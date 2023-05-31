import 'package:devpace/widgets/list.dart';
import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Scrollbar(
          thickness: 8,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset("assets/images/logo.png")),
                  const MyList()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
