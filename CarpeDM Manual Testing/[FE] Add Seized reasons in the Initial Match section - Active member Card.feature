Feature:
  Add the reason why the active member card user liked the match.
  
  Background:
    Given that userB liked userA - (SeizeMatch).

  Scenario: #1
    When userA performs SeizeMatch with userB.
    Then the "IsSeizedByBothUsers" field is updated to "true".
    And the StatusName field of matchUserA and matchUserB is updated to "SeizedMatch"
    And userA profile should show the reason why userA liked the match with userB with the initial match expiration date "InitialMatchExpires" in the "INITIAL MATCH" section.
    And in userB profile, you should display the reason why userB liked the match with userA with the initial match expiration date "InitialMatchExpires" in the "INITIAL MATCH" section.