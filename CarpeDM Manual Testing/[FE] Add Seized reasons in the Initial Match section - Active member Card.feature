Feature:
  Add the reason why the active member card user liked the match.
  
  Background:
    Given that userB liked userA - (SeizeMatch).

  Scenario: #1
    When userA performs SeizeMatch with userB.
    Then the "IsSeizedByBothUsers" field is updated to "true".
    And the "StatusName" field of matchUserA and matchUserB is updated to "SeizedMatch"
    And userA profile should show the reason why userA liked the match with userB with the initial match expiration date "InitialMatchExpires" in the "INITIAL MATCH" section.
    And in userB profile, you should display the reason why userB liked the match with userA with the initial match expiration date "InitialMatchExpires" in the "INITIAL MATCH" section.
    
  Scenario: #2
    When userA performs PassMatch with userB.
    Then the "StatusName" field of matchUserA is updated to "PassedByMatch" and the "StatusName" field of matchUserB is updated to "PassedMatch".
    And the "PassedMatchedReason" field is updated on matchUserA and matchUserB for the reason userA chose.
    And userA profile should show the reason why userA did PassMatch with userB and the text "Passed Match" in the "REJECTED MATCHES" section.
    And userB profile should show the reason why userA did PassMatch with userB and the text "Passed Match" in the "REJECTED MATCHES" section.
    
  Scenario: #3
    When userA performs ReportMatch with userB.
    Then the "StatusName" field of matchUserA and matchUserB is updated to "ReportedMatch".
    And the "ReportedReason" field is updated on matchUserA and matchUserB for the reason userA chose.
    And userA profile should show the reason why userA made a ReportMatch with userB by using the text "[First Name userA] reported [First Name userB] for [reason]" in the "REPORTED MATCHES" section.
    And userB profile should show the reason why userA did a ReportMatch with userB by using the text "[First Name userA] reported [First Name userB] for [reason]" in the "REPORTED MATCHES" section.
    
  Scenario: #4
    When userA performs RemainMatch (true) with userB.
    Then the "StatusName" field of matchUserA is updated to "SeizedMatch" and the "StatusName" field of matchUserB is updated to "RemainMatch".
    And the "RemainMatchedReason" field is updated on matchUserB for the reason userA chose.
    And userA profile must show the reason why userA remains paired with userB in the "QUALIFIED MATCH" section.
    And userB profile shouldn't show anything.
    
  Scenario: #5
    When userA performs RemainMatch (false) with userB.
    Then the "StatusName" field of matchUserA is updated to "SeizedMatch" and the "StatusName" field of matchUserB is updated to "UnmatchedMatch".
    And the "UnmatchedReason" field is updated on matchUserB for the reason userA chose.
    And UserA profile must show the reason why UserA remains matched with UserB in the "UNMATCHED MATCHES" section.
    And userB profile shouldn't show anything.