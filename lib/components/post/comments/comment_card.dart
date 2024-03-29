import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:relate_admin/constants/colors.dart';
import 'package:relate_admin/constants/image_strings.dart';

class CommentCard extends StatefulWidget {
  final String userName, commentBody;
  final Timestamp timestamp;

  const CommentCard(
      {super.key,
      required this.userName,
      required this.commentBody,
      required this.timestamp});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    //Format date
    final dateTime = widget.timestamp.toDate();
    final formattedDate = DateFormat.yMMMMEEEEd().format(dateTime);
    final formattedTime = DateFormat.Hm().format(dateTime);

    final formattedDateTime = "$formattedDate $formattedTime";

    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!, // Set the color of the border
            width: 1.0, // Set the width of the border
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      Text(
                        "@ $formattedTime",
                        style:
                            const TextStyle(fontSize: 15, color: primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              // Lottie.asset(relateHeart),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.commentBody,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
