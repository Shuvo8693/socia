import 'package:flutter/material.dart';
import 'package:socia/core/utility/assets_image.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.imageIndex,
    required bool shouldUseAddIcon,
    this.onTab,
    required this.text,
    required this.image,
  }) : _shouldUseAddIcon = shouldUseAddIcon;

  final String imageIndex;
  final bool _shouldUseAddIcon;
  final Function()? onTab;
  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 154,
          width: 96,
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    blurRadius: 1.0,
                    spreadRadius: 0.0,
                    offset: const Offset(1, 0))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(text ?? 'No name'),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: onTab,
              child: Container(
                height: 128,
                width: 96,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: imageIndex.isEmpty
                            ? AssetImage(AssetImg.noImage)
                            : NetworkImage(imageIndex) as ImageProvider,
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 28,
            width: 28,
            child: CircleAvatar(
              backgroundImage: image!.isNotEmpty
                  ? NetworkImage(image!)
                  : AssetImage(AssetImg.noPersonImg) as ImageProvider,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
        _shouldUseAddIcon
            ? const Positioned(
                left: 41,
                top: 62,
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ))
            : const SizedBox(),
      ],
    );
  }
}
