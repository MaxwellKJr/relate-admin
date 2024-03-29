import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relate_admin/components/post/comments/comment_card.dart';
import 'package:relate_admin/constants/colors.dart';
import 'package:relate_admin/constants/size_values.dart';
import 'package:relate_admin/constants/text_string.dart';
import 'package:relate_admin/screens/post_issue/view_post_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relate_admin/components/post/post_bottom_icons.dart';

class CommentsSection extends StatefulWidget {
  final String professionalId;
  const CommentsSection({super.key, required this.professionalId});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.professionalId)
            .collection('comments')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final comments = snapshot.data?.docs;
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comments?.length,
              itemBuilder: (context, index) {
                final comment = comments![index];
                return CommentCard(
                  userName: comment['userName'],
                  commentBody: comment['commentBody'],
                  timestamp: comment['timestamp'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
