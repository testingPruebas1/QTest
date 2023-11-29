Feature: Membership Payment After Onboarding Interview

  Background:
    Given a WRP User in the onboarding process

  Scenario: User Pays for Membership after Interview Approval
    Given the user is in status INTERVIEWAPPROVED
    When the user logs in to the WRP
    Then the user should see plan options to select and pay
    And the user should not see the card to review BCK status
    And the UI, menus, and screens should be the same as in BCKCOMPLETED (the interface we are currently viewing)

  Scenario: User Pays for Membership after Interview Skipped
    Given the user is in status INTERVIEWSKIPPED
    When the user logs in to the WRP
    Then the user should see plan options to select and pay
    And the user should not see the card to review BCK status
    And the UI, menus, and screens should be the same as in BCKCOMPLETED (the interface we are currently viewing)

  Scenario: User Does Not See BCK Status Card after Payment
    Given the user is in status PAID
    When the user logs in to the WRP
    Then the user should not see the card to review BCK status
    And the user should have a link to download the app
    And when the user clicks on the "Download CarpeDM" button on the /dashboard screen
    Then an SMS should be sent to the user with the URL of the application
