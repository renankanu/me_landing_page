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
          const Text('Repo'),
          Query(
            options: QueryOptions(document: gql(pinnedQuery)),
            builder: (
              QueryResult result, {
              VoidCallback? refetch,
              FetchMore? fetchMore,
            }) {
              if (result.hasException) {
                return const Text('Error');
              }
              log(result.data.toString());
              return const Text('Pinned');
            },
          )
        ],
      ),
    );
  }
}
