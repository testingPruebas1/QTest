Feature: Adding "INTERVIEWHOLD" Status in WRP Admin Portal

  Scenario: Adding "INTERVIEWHOLD" Status Button for WRP user in status INTERVIEWPAID
    Given a WRP user in status INTERVIEWPAID
    When I go to the Profile Status tab in the Admin portal
    Then I should see a new button "Hold" next to "Not Passed" and "Missed"
    And the "Passed" button should be moved below the "Hold" button

  Scenario: Updating ProfileStatus to "INTERVIEWHOLD" when Admin clicks on "Hold" button
    Given a WRP user in status INTERVIEWPAID
    When I click on the "Hold" button in the Admin portal
    Then the ProfileStatus in the WRP user object should be updated to "INTERVIEWHOLD"

  Scenario: Displaying "USER IS HOLD" Text for WRP user in status INTERVIEWHOLD
    Given a WRP user in status INTERVIEWHOLD
    When I view the user details
    Then the text "USER IS HOLD" should be displayed

  Scenario: Displaying "Passed", "Not Passed", and "Missed" options below "USER IS HOLD"
    Given a WRP user in status INTERVIEWHOLD
    When I view the user details
    Then the options "Passed", "Not Passed", and "Missed" should be displayed below "USER IS HOLD"

  Scenario: Adding "INTERVIEWHOLD" Status Filter Option in Pool Screen
    Given I am on the Pool screen in the Admin portal
    When I look at the status filter options
    Then I should see "INTERVIEWHOLD" as an option
    And when I filter by "INTERVIEWHOLD", only users in this status should be displayed