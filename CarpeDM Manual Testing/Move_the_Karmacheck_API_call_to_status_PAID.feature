Feature: Move the Karmacheck API call to status PAID

  Background:
    Given the UserWRP is in the INTERVIEWAPPROVED, INTERVIEWSKIPPED, or BCKCOMPLETED profile state

  Scenario: UserWRP updates profile to PAID from INTERVIEWAPPROVED, Karmacheck creates a case, and an email related to Karma is sent
    Given the UserWRP is in the INTERVIEWAPPROVED profile state
    When the UserWRP updates their profile to PAID
    Then a case should be created in the BackgroundCheck collection in the database with the status "CaseCreated"
    And an email related to Karma should be sent to the UserWRP

  Scenario: UserWRP updates profile to PAID from INTERVIEWSKIPPED, a new case is created, and an email related to Karma is sent
    Given the UserWRP is in the INTERVIEWSKIPPED profile state
    When the UserWRP updates their profile to PAID
    Then a case should be created in the BackgroundCheck collection in the database with the status "CaseCreated"
    And an email related to Karma should be sent to the UserWRP

  Scenario: UserWRP updates profile to PAID from BCKCOMPLETED, no new case is created, and no email related to Karma is sent
    Given the UserWRP is in the BCKCOMPLETED profile state
    When the UserWRP updates their profile to PAID
    Then no new case should be created in the BackgroundCheck collection in the database
    And no email related to Karma should be sent to the UserWRP
