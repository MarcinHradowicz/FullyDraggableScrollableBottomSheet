import 'package:flutter/material.dart';

class ImprovedDraggableScrollableSheet extends StatefulWidget {
  const ImprovedDraggableScrollableSheet({Key? key}) : super(key: key);

  @override
  State<ImprovedDraggableScrollableSheet> createState() => _ImprovedDraggableScrollableSheetState();
}

class _ImprovedDraggableScrollableSheetState extends State<ImprovedDraggableScrollableSheet> {
  final GlobalKey commentsHeaderKey = GlobalKey();

  double commentsHeaderHeight = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Sets initial size of comments bottom sheet. Thanks to it users always see just a header of the bottom sheet at the beginning.
      final double currentCommentsHeaderHeight = commentsHeaderKey.currentContext?.size?.height ?? 0;
      if (currentCommentsHeaderHeight != commentsHeaderHeight) {
        setState(() {
          commentsHeaderHeight = currentCommentsHeaderHeight;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    // In most cases the better idea here is to use LayoutBuilder widget and [BoxConstrainst.height] instead of max height of the device.
    final double heightOfDevice = mediaQueryData.size.height;
    final double initialChildSize =
        (commentsHeaderHeight + mediaQueryData.viewPadding.bottom + mediaQueryData.viewPadding.top) / heightOfDevice;

    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: initialChildSize,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          // padding: EdgeInsets.only(bottom: mediaQueryData.viewPadding.bottom),
          margin: EdgeInsets.only(top: mediaQueryData.viewPadding.top),
          decoration: const BoxDecoration(
            color: Color(0xffB1B2ff),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _CommentsHeader(key: commentsHeaderKey, scrollController: scrollController),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
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

class _CommentsHeader extends StatelessWidget {
  const _CommentsHeader({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _CommentsHeaderPill(),
          const Text('Comments'),
          const SizedBox(height: 8),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
          Divider(color: Colors.black.withOpacity(0.5), height: 2, thickness: 2),
        ],
      ),
    );
  }
}

class _CommentsHeaderPill extends StatelessWidget {
  const _CommentsHeaderPill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Container(
          width: 56,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
