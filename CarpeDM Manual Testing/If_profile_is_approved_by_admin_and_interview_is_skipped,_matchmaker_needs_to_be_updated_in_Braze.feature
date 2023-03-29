Feature: If profile is approved by admin and interview is skipped, matchmaker needs to be updated in Braze
  The matchmaker_assigned custom attribute needs to be updated in Braze
  If you click the "ACCEPT and SKIP INTERVIEW" button and choose a matchmaker

  Background:
    Given that a WRP user has just sent her profile (SUBMITTED)

  Scenario: #1
    When a root admin, administrator, or matchmaker navigates to a user profile that is in the "SUBMITTED" state.
    And click on the "ACCEPT and SKIP INTERVIEW" button.
    And choose a matchmaker from the list.
    Then the Matchmaker field on the user object will be updated.
    And the matchmaker_assigned custom attribute will be updated in Braze with the First and Last name value of the matchmaker that was chosen.