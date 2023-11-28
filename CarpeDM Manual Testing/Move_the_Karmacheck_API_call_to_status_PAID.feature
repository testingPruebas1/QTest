Feature: Move the Karmacheck API call to status PAID

  Background:
    Given the UserWRP is in the INTERVIEWAPPROVED profile state

  Scenario: UserWRP updates profile to PAID, Karmacheck creates a case, and an email is sent
    When UserWRP updates their profile to PAID
    Then the Karmacheck API should create a case
    And an email related to Karma should be sent to UserWRP

  Scenario: UserWRP updates profile to PAID from BCKCOMPLETED, no new case, and email is sent
    Given the UserWRP is in the BCKCOMPLETED profile state
    When UserWRP updates their profile to PAID
    Then no new case should be created in Karmacheck
    And an email related to Karma should be sent to UserWRP
