Feature: Update IsBackGroundCheckInitiated when BCK is Initiated

  Scenario: Update IsBackGroundCheckInitiated when BCK is Initiated
    Given that Karmacheck notifies that the BCK has started
    When the BCK is initiated
    Then a new record should be created in the BackgroundCheck collection with the status "CaseCreated"
    And at this moment, IsBackGroundCheckInitiated in the user object should be updated to true