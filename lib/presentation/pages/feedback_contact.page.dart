import 'package:flutter/material.dart';

import '../theme/colors.t.dart';

class FeedbackContactPage extends StatefulWidget {
  @override
  _FeedbackContactPageState createState() => _FeedbackContactPageState();
}

class _FeedbackContactPageState extends State<FeedbackContactPage> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Report a problem'),
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => {}, // TODO implement form submission
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text('Send',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      )),
                ),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 85),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Something is wrong or isn't working?",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please explain briefly what happened and how do you reproduce the issue',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextField(
            cursorColor: AppColors.grey,
            controller: _controller,
            autofocus: true,
            autocorrect: false,
            maxLines: null,
            style: const TextStyle(
              color: AppColors.greyLightest,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              filled: false,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      );
}
