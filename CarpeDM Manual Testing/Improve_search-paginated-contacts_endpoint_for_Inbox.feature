Feature: Improve search-paginated-contacts endpoint for Inbox

Scenario: Searching users by FirstName
  Given there are multiple users in the system
  And the user enters a FirstName in the search field
  When the user performs the search
  Then the users matching the FirstName should be returned

Scenario: Searching users by LastName
  Given there are multiple users in the system
  And the user enters a LastName in the search field
  When the user performs the search
  Then the users matching the LastName should be returned

Scenario: Searching users by PreferredName
  Given there are multiple users in the system
  And the user enters a PreferredName in the search field
  When the user performs the search
  Then the users matching the PreferredName should be returned

Scenario: Searching users by FirstName and LastName simultaneously
  Given there are multiple users in the system
  And the user enters a FirstName and LastName in the search field
  When the user performs the search
  Then the users matching the FirstName and LastName should be returned

Scenario: Searching users by PreferredName and LastName simultaneously
  Given there are multiple users in the system
  And the user enters a PreferredName and LastName in the search field
  When the user performs the search
  Then the users matching the PreferredName and LastName should be returned

Scenario: Searching users by FirstName + LastName or PreferredName + LastName simultaneously
  Given there are multiple users in the system
  And the user enters a FirstName + LastName or PreferredName + LastName in the search field
  When the user performs the search
  Then the users matching the FirstName + LastName or PreferredName + LastName should be returned

Scenario: Searching users without entering any value
  Given there are multiple users in the system
  And the user does not enter any value in the search field
  When the user performs the search
  Then no users should be returned

Scenario: Searching users by entering only spaces in the search field
  Given there are multiple users in the system
  And the user enters only spaces in the search field
  When the user performs the search
  Then no users should be returned

Scenario: Ignoring spaces in the search field
  Given there are multiple users in the system
  And the user enters a search string with leading and trailing spaces in the search field
  When the user performs the search
  Then the users matching the search string (ignoring the leading and trailing spaces) should be returned

Scenario: Searching users with special characters in search fields
  Given there are multiple users in the system
  And the user enters a search string with special characters in the search field
  When the user performs the search
  Then the users matching the search string should be returned