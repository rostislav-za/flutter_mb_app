



class SearchUserAction {
  final String string_for_search;

  SearchUserAction(this.string_for_search);
}

class UserClickedAction {
  final String username;

  UserClickedAction(this.username);
}

class RepositoryClickedAction {
  final String repository;

  RepositoryClickedAction(this.repository);
}
