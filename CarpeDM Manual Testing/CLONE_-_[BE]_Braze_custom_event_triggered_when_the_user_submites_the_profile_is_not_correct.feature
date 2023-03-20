Feature: CLONE - [BE] Braze custom event triggered when the user submites the profile is not correct

 Expected results:  the backend must trigger the custom event to Braze profile_submitted

Scenario: User status: INITIAL

Given user is in status INITIAL, and have completed  Media, Questionnaire and Match Settings

When user clicks on Submit Profile button

Then user must check in Braze, that the custom event profile_submitted is triggered in Braze.

Scenario: User status: AMEND

Given user is in status AMEND, and have completed  Media, Questionnaire and Match Settings

When user clicks on Submit Profile button

Then user must check in Braze, that the custom event profile_submitted is triggered in Braze.