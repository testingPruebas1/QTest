Feature:
  Add the reason why the active member card user liked the match.
  
  Background:
    Given that user B liked user A.

  Scenario: #1
    Given that user A liked user B.
    Then the "IsSeizedByBothUsers" field is updated to "true".
    And user A profile should show the reason why user A liked the match with user B.
    And in user B profile you should show the reason why user B liked the match with user A.
