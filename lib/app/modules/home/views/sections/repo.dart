import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/core.dart';

class Repo extends StatelessWidget {
  const Repo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        children: [
          Text('Repo'),
          Query(
            options: QueryOptions(document: gql(pinnedQuery)),
            builder: (
              QueryResult result, {
              VoidCallback? refetch,
              FetchMore? fetchMore,
            }) {
              if (result.hasException) {
                return Text('Error');
              }
              log(result.data.toString());
              return Text('Pinned');
            },
          )
        ],
      ),
    );
  }
}
