Feature:
  Add the reason why the active member card user liked the match.
  
  Background:
    Given that user B liked user A - (SeizeMatch).

  Scenario: #1
    When user A performs SeizeMatch with user B.
    Then the "IsSeizedByBothUsers" field is updated to "true".
    And the StatusName field of matchUser A and matchUser B is updated to "SeizedMatch"
    And user A profile should show the reason why user A liked the match with user B with the initial match expiration date "InitialMatchExpires" in the "INITIAL MATCH" section.
    And in user B profile, you should display the reason why user B liked the match with user A with the initial match expiration date "InitialMatchExpires" in the "INITIAL MATCH" section.