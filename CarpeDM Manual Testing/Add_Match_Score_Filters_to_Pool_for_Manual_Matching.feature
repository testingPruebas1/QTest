Feature: Add Match Score Filters to Pool for Manual Matching

  Scenario: Admin adds Match Score filters to search options in the Pool for Manual Matching
    Given the admin user is on the Admin Portal
    When the admin navigates to the configuration of the Pool for Manual Matching
    And adds Match Score filters to the Primary Filters
    Then Match Score filters should be available in the Pool for Manual Matching

  Scenario: Admin selects a Match Score range in the Pool for Manual Matching
    Given the admin user is on the Pool for Manual Matching page
    When the admin selects Match Score filters in the Primary Filters
    Then the admin should be able to choose a Match Score range from 0.00 to 5.00
    And the Match Score filters should allow selecting numbers with up to 2 decimal places

  Scenario: Matchmaker filters users by Match Score in the Pool for Manual Matching
    Given the matchmaker is on the Pool for Manual Matching page
    When the matchmaker selects a Match Score range in the Primary Filters
    Then the list of members should be filtered based on the selected Match Score range
    And the Match Score should be within the specified range for each displayed member
