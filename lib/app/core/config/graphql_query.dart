String get pinnedQuery => '''
   {
      viewer {
        repositories {
          totalCount
        }
        starredRepositories {
          totalCount
        }
        pinnedItems(first: 6) {
          nodes {
            ... on Repository {
              name
              url
              description
              owner {
                avatarUrl
              }
              updatedAt
              primaryLanguage {
                name
                color
              }
            }
          }
        }
        contributionsCollection {
          totalCommitContributions
        }
      }
    }
''';
