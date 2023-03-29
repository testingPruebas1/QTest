Feature:
  Add the reason why the active member card user liked the match.
  
  Background:
    Given that userB liked userA - (SeizeMatch).

  Scenario: #2
    When userA performs PassMatch with userB.
    Then the "StatusName" field of matchUserA is updated to "PassedByMatch" and the "StatusName" field of matchUserB is updated to "PassedMatch".
    And the "PassedMatchedReason" field is updated on matchUserA and matchUserB for the reason userA chose.
    And userA profile should show the reason why userA did PassMatch with userB and the text "Passed Match" in the "REJECTED MATCHES" section.
    And userB profile should show the reason why userA did PassMatch with userB and the text "Passed Match" in the "REJECTED MATCHES" section.
    