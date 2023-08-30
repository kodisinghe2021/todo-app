import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/constant.dart';
import 'package:student_app/model/task_model.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    required this.currentModel,
    required this.currentIndex,
    super.key,
  });

  final TaskModel currentModel;
  final int currentIndex;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F0E8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.61),
            offset: const Offset(0, 7),
            blurRadius: 25,
            spreadRadius: -10,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: [
          SizedBox(
            width: getScreenSize(context).width * .9,
            child: Text(
              widget.currentModel.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            // width: getScreenSize(context).width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: getScreenSize(context).width * .75,
                  child: Text(
                    isExpand
                        ? widget.currentModel.body.trim()
                        : "${widget.currentModel.body.trim().substring(0, 20)}...",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isExpand = !isExpand;
                    });
                  },
                  icon: isExpand
                      ? const Icon(Icons.expand_less)
                      : const Icon(Icons.expand_circle_down),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
