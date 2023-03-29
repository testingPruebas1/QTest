Feature:
  Add the reason why the active member card user liked the match.
  
  Background:
    Given that user A liked user B.

  Scenario:
    Given that user B liked user A.
    Given that user B liked user A.
    Then the IsSeizedByBothUsers field is updated to "true".
    And user A's profile should show the reason why user A liked the match with user B.
    And in user B's profile you should show the reason why user B liked the match with user A.
