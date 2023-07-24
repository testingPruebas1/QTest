Feature: Saving Proposed Match in Manual Matching

  Background:
    Given I am logged in as a matchmaker in the admin panel

  Scenario: Saving a Proposed Match between User A and User B
    Given I am on the Pool for manual matching screen
    And I select an active member as User A
    When I select a possible candidate as User B
    And I save the proposed match
    Then the proposed match should be saved for User A and User B in the database
    And both User A and User B should be listed in the saved candidates section in the front-end

  Scenario: Verifying Proposed Match between User A and User B saved for both users
    Given there is a saved proposed match between User A and User B in the database
    When I check the proposed candidates for User A
    Then User B should be listed as a proposed match for User A in the front-end
    And when I check the proposed candidates for User B
    Then User A should be listed as a proposed match for User B in the front-end

  Scenario: Verifying Proposed Match not visible for other matchmakers
    Given there is a saved proposed match between User A and User B in the database
    And another matchmaker is logged in as well
    When the other matchmaker checks the proposed candidates for User B
    Then User A should not be listed as a proposed match for User B in the front-end
    And when the other matchmaker checks the proposed candidates for User A
    Then User B should not be listed as a proposed match for User A in the front-end