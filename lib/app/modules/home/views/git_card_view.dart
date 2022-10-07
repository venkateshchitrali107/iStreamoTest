import 'package:flutter/material.dart';
import 'package:i_streamo_test/app/Utils/Styles.dart';
import 'package:i_streamo_test/app/modules/home/model/git_response.dart';

class GitCardView extends StatelessWidget {
  final GitResponse gitResp;
  GitCardView(this.gitResp);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Container(
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  "asset/bookmark.png",
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        gitResp.name ?? "Unnamed Repo",
                        style: getMobileRegularTextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Container(
                      child: Text(
                        gitResp.description ?? "",
                        style: getMobileRegularTextStyle(
                          weight: FontWeight.normal,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
