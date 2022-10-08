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
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(
                      height: 8,
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
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if ((gitResp.language ?? '').isNotEmpty)
                            Row(
                              children: [
                                Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    "asset/code.png",
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  gitResp.language!,
                                ),
                              ],
                            ),
                          if ((gitResp.language ?? '').isNotEmpty) Spacer(),
                          Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "asset/bug.png",
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text("${gitResp.openIssues ?? 0}"),
                          Spacer(),
                          Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "asset/face.png",
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text("${gitResp.watchers ?? 0}"),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    )
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
