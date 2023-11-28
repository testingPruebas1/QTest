Feature: CarpeDM Algorithm for Matchmaking

  Background:
    Given there are active members in the CarpeDM system
    And the algorithm runs once a week on a specific day

  Scenario: Generation of Array of Profiles
    When the algorithm generates an array of 3 approvedProfile Users for each active member
    Then the profiles should be selected based on the averageRating field
    And the profiles should be presented randomly to avoid redundancy

  Scenario: Prioritization of Profiles by Rating
    When the active member views the presented profiles
    Then the profiles with higher averageRating should be prioritized
    And there should be 2 profiles with a rating greater than 4 and 1 profile with a rating between 3 and 4

  Scenario: Compatibility of Gender and Sexual Orientation
    Given the active member has specified Gender, MediaGender, and SexualOrientation in the questionnaire
    When the algorithm selects profiles for the active member
    Then the proposed profiles should be compatible with the active member's preferences

  Scenario: Execution Frequency of the Algorithm
    When the algorithm runs once a week on a specific day
    Then the profiles should be delivered at different times within that day
    And it may incorporate the times when each user is online

  Scenario: Expiration of Profiles without Interaction
    Given the profiles are presented to the active member
    When there is no interaction with the profiles in the first week
    Then 3 additional profiles should be sent in the second week
    And if there is still no interaction, the initial 3 profiles should expire, and 3 new profiles sent in the following week

  Scenario: Maximum Limit of Profiles
    Given the active member has not reached the limit of 6 profiles
    When the algorithm sends new profiles
    Then the active member can receive new profiles until reaching the limit of 6 displayed in the app

  Scenario: Unique Profiles for Each Active Member
    When the algorithm generates profiles for active members
    Then each active member should receive a unique set of profiles every week
    And no duplicates should be presented to the same active member

  Scenario: Limit for Approvers of Profiles
    Given a user with approval privileges
    When the user sends profiles for approval
    Then the user can send up to 15 accounts per week

  Scenario: Storage of Profile Information
    When the profiles are approved and served to active members
    Then the system should save the Profile Picture, Name, Age, and Hobby for the approvedProfile users

  Scenario: Prevention of Duplicate Profiles
    Given profiles have been served to active members
    When the algorithm runs again
    Then the system should prevent sending duplicate profiles to active members
