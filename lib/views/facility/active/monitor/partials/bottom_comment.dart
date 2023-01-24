// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/facility_monitor.dart';
import 'package:no_stunting/views/facility/active/monitor/calendar.dart';

FacilityMonitorService facilityService = FacilityMonitorService();

class FacilityMonitorCommentBottom extends StatefulWidget {
  MonitorPatientDataById monitor;
  Function changeCheck;
  FacilityMonitorCommentBottom(
      {required this.monitor, required this.changeCheck});

  @override
  State<FacilityMonitorCommentBottom> createState() =>
      _FacilityMonitorCommentBottomState();
}

class _FacilityMonitorCommentBottomState
    extends State<FacilityMonitorCommentBottom> {
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  void getPreviousComment() async {
    var result = await facilityService.getPreviousComment(
        patientId: widget.monitor.patientId, postId: widget.monitor.id);

    _controller.text = result["content"];
  }

  void postComment() async {
    setState(() {
      isLoading = true;
    });
    var result = await facilityService.postComment(
        patientId: widget.monitor.patientId,
        postId: widget.monitor.id,
        comment: _controller.text.toString());

    _controller.text = result["content"];
    setState(() {
      isLoading = false;
    });

    widget.changeCheck(true);

    Navigator.pop(context);
  }

  @override
  void initState() {
    getPreviousComment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: MyColor.level3,
        padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        // padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: MyColor.level4,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(8),
                child: TextField(
                  maxLines: 4, //or null
                  autofocus: true,
                  controller: _controller,
                  style: TextStyle(color: MyColor.level1),
                  decoration: InputDecoration.collapsed(
                      hintText: "Beri komentar",
                      hintStyle: TextStyle(color: MyColor.level1)),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => postComment(),
                  child: !isLoading
                      ? Icon(
                          Icons.send,
                          size: 24,
                          color: MyColor.level4,
                        )
                      : LoadingAnimationWidget.dotsTriangle(
                          // LoadingAnimationwidget that call the
                          color: Colors.white, // staggeredditwave animation
                          size: 20,
                        ),
                ))
          ],
        ));
  }
}
