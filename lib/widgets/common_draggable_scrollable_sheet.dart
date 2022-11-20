import 'package:flutter/material.dart';

class CommonDraggableScrollableSheet extends StatelessWidget {
  const CommonDraggableScrollableSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 30,
                  itemBuilder: (context, index) => Container(
                    color: index % 2 == 0 ? const Color(0xffAAC4FF) : const Color(0xffD2DAFF),
                    child: ListTile(title: Text('Comment $index')),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
