Feature: Testing search-paginated-contacts endpoint

Scenario: Searching with a non-empty keyword
  Given the search-paginated-contacts endpoint is available
  When I search with a non-empty keyword
  Then the response should contain users whose First Name, Preferred Name, or Last Name match the keyword

Scenario: Searching with a keyword containing multiple words
  Given the search-paginated-contacts endpoint is available
  When I search with a keyword containing multiple words
  Then the response should contain users whose First Name, Preferred Name, or Last Name match the keyword combination

Scenario: Searching with an empty keyword
  Given the search-paginated-contacts endpoint is available
  When I search with an empty keyword
  Then the response should contain all users based on the filters (myMembers and adminsAndMatchmakers)

Scenario: Searching with a keyword containing only whitespace
  Given the search-paginated-contacts endpoint is available
  When I search with a keyword containing only whitespace
  Then the response should be empty

Scenario: Searching with a keyword containing leading/trailing whitespace
  Given the search-paginated-contacts endpoint is available
  When I search with a keyword containing leading/trailing whitespace
  Then the response should contain users whose First Name, Preferred Name, or Last Name match the trimmed keyword

Scenario: Filtering by myMembers and adminsAndMatchmakers
  Given the search-paginated-contacts endpoint is available
  When I search with a keyword and filter by myMembers and adminsAndMatchmakers
  Then the response should contain only active users who are members of the administrator and root-admins, admins, and matchmakers

Scenario: Searching with a non-matching keyword
  Given the search-paginated-contacts endpoint is available
  When I search with a non-matching keyword
  Then the response should be empty

Scenario: Searching with a keyword that matches email
  Given the search-paginated-contacts endpoint is available
  When I search with a keyword that matches an email
  Then the response should be empty

Scenario: Searching with FirstName + LastName combination
  Given the search-paginated-contacts endpoint is available
  When I search with a keyword that matches FirstName + LastName
  Then the response should contain users whose FirstName + LastName combination matches the keyword

Scenario: Filtering by myMembers (true) and adminsAndMatchmakers (false)
  Given the search-paginated-contacts endpoint is available
  When I search with a keyword and filter by myMembers (true) and adminsAndMatchmakers (false)
  Then the response should contain only active users who are members of the administrator

Scenario: Filtering by myMembers (false) and adminsAndMatchmakers (true)
  Given the search-paginated-contacts endpoint is available
  When I search with a keyword and filter by myMembers (false) and adminsAndMatchmakers (true)
  Then the response should contain only root-admins, admins, and matchmakers
