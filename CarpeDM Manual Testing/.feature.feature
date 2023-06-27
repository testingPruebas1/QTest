Feature: User Avatar Options - Desktop

  Scenario: Displaying options in user avatar dropdown for WRP user in PAID or BCKCOMPLETED status
    Given a WRP user in status PAID or BCKCOMPLETED
    When the user clicks on the user Avatar
    Then a dropdown list should be displayed with the options: Log Out and My Profile

  Scenario: Logging out from WRP after clicking Log Out option in user avatar dropdown
    Given a WRP user in status PAID or BCKCOMPLETED
    And the user clicks on the user Avatar
    When the user selects Log Out from the dropdown
    Then a confirmation pop-up should be displayed
    And the user confirms the pop-up
    Then the user should be logged out from the WRP
    And the user should be redirected to the login screen

  Scenario: Redirecting to Account Settings after clicking My Profile option in user avatar dropdown
    Given a WRP user in status PAID or BCKCOMPLETED
    And the user clicks on the user Avatar
    When the user selects My Profile from the dropdown
    Then the user should be redirected to "Account Settings"

  Scenario: Displaying Log Out option in sidebar for WRP user in PAID or BCKCOMPLETED status
    Given a WRP user in status PAID or BCKCOMPLETED
    When the user is on a responsive view
    Then the Log Out button should be displayed in the sidebar

  Scenario: Logging out from WRP after clicking Log Out button in sidebar
    Given a WRP user in status PAID or BCKCOMPLETED
    And the user is on a responsive view
    When the user clicks on the Log Out button in the sidebar
    Then a confirmation pop-up should be displayed
    And the user confirms the pop-up
    Then the user should be logged out from the WRP
    And the user should be redirected to the login screen