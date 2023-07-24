Feature: Update Membership Endpoint Functionality

  Scenario: Saving a New Membership for a User and Adding Matches to UserMatches Object
    Given a user with an existing membership
    And the user's current total number of matches is known
    When the Update-membership endpoint is executed to save a new membership for the user
    Then the total number of matches in the UserMatches object should be updated by adding the matches from the new plan to the current total
    And a new object inside the usermatch collection must not be created

  Scenario: Generating New Set of Future Match Dates for User with Existing Dates
    Given a user with an existing membership and future match dates
    And the new membership plan specifies additional future match dates
    When the Update-membership endpoint is executed to save a new membership for the user
    Then the system should generate a new set of future match dates that includes both the previous dates and the new ones from the new plan
    And the existing future match dates that belong to the previous membership should not be removed

  Scenario: Generating New Set of Future Match Dates for User without Previous Dates
    Given a user with no previous future match dates
    And the new membership plan specifies future match dates
    When the Update-membership endpoint is executed to save a new membership for the user
    Then the system should generate a new set of future match dates that includes the dates from the new plan
    And the NextMatchDateTime should be completed as it is currently done for the first time the member gets a plan