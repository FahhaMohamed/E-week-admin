import 'package:admin/core/contants/colors.dart';
import 'package:admin/core/utils/heading_text.dart';
import 'package:flutter/material.dart';

class TeamScoresTile extends StatelessWidget {
  const TeamScoresTile({
    super.key,
    required this.width,
    required this.teamName,
    required this.teamScore,
    required this.teamColor,
    required this.increment,
    required this.decrement,
    required this.isCompleted,
  });

  final double width;
  final String teamName;
  final String teamScore;
  final Color teamColor;
  final VoidCallback increment;
  final VoidCallback decrement;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            decoration:
                const BoxDecoration(color: AppColors.dateContainerColor),
            children: [
              TableCell(
                child: Container(
                  width: width * .09,
                  height: width * .09,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.iconColor, width: 2),
                      color: teamColor,
                      shape: BoxShape.circle),
                ),
              ),
              TableCell(
                child: subHeadingText(text: teamName),
              ),
              TableCell(
                child: Row(
                  children: [
                    eventText(text: "POINTS: "),
                    scoreText(text: teamScore),
                  ],
                ),
              ),
              if (!isCompleted)
                TableCell(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed:  increment,
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.iconColor,
                        )),
                    IconButton(
                        onPressed: decrement,
                        icon: const Icon(
                          Icons.minimize,
                          color: AppColors.iconColor,
                        )),
                  ],
                )),
            ])
      ],
    );
  }
}
