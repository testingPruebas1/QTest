Feature: Viewing the Latest Interview Event on UserWRP Dashboard

  Background:
    Given a UserWRP with a profile state of "INTERVIEWPAID" or "INTERVIEWMISSED"
    And there is an array of events retrieved from the "/api/CarpeDM/all-events-get" endpoint
    And the array contains at least one event of type "interview" with the following fields and values:
      | eventTypeName   | eventTypeStatusName |
      | "1"             | "3"                 |
    And the array is ordered in descending order based on event creation time, with the most recent event at the end.

  Scenario: UserWRP with "INTERVIEWPAID" profile state views the latest "interview" event created by UserAdmin
    Given a UserWRP with a profile state of "INTERVIEWPAID"
    When the UserWRP accesses their "/dashboard" screen
    Then the UserWRP should see the latest "interview" event created by UserAdmin on their screen

  Scenario: UserWRP with "INTERVIEWPAID" profile state views the latest "interview" event created by themselves
    Given a UserWRP with a profile state of "INTERVIEWPAID"
    When the UserWRP accesses their "/dashboard" screen
    Then the UserWRP should see the latest "interview" event created by themselves on their screen

  Scenario: UserWRP with "INTERVIEWMISSED" profile state views the latest "interview" event created by UserAdmin
    Given a UserWRP with a profile state of "INTERVIEWMISSED"
    When the UserWRP accesses their "/dashboard" screen
    Then the UserWRP should see the latest "interview" event created by UserAdmin on their screen

  Scenario: UserWRP with "INTERVIEWMISSED" profile state views the latest "interview" event created by themselves
    Given a UserWRP with a profile state of "INTERVIEWMISSED"
    When the UserWRP accesses their "/dashboard" screen
    Then the UserWRP should see the latest "interview" event created by themselves on their screen
