Feature: Algorithm for Serving Attractive ProfileApproved Users to Active Members

  Scenario: Admin configures the matching algorithm
    Given that I am a CarpeDM system admin
    When I want to implement an algorithm that serves a curated array of 3 approvedProfile users for each active member
    Then I should be able to configure the algorithm with the following criteria:
      | Generating an array of 3 approvedProfile users for each active member.
      | Prioritizing profiles based on the averageRating field.
      | Randomizing the visibility and serving of profiles to avoid sending the same profiles to all active members simultaneously.
      | Considering the fields of Gender, MediaGender, and SexualOrientation from the questionnaire to determine the compatibility of gender identity between the proposed profiles and the active members.
      | Running the algorithm weekly on a specific day, with delivery times randomly selected within that day to avoid sending matches to active members at the same time every week.

  Scenario: Algorithm serves attractive profiles based on rating
    Given that the matching algorithm is configured
    When the algorithm runs once a week
    Then it should generate a list of 3 approved profiles for each active member based on:
      | Two profiles with a rating greater than 4.
      | One profile with a rating between 3 and 4.
      | If there are no more profiles with a rating greater than 4 but there are 3 with a rating between 3 and 4, those profiles should be served.
      | If there are not enough users with a rating greater than 3 to serve, no profiles should be sent that week.
      | Profiles with a rating less than 3 should not be served.
      | Randomizing the visibility and delivery to active members.

  Scenario: Algorithm manages profile interaction and expiration
    Given that the algorithm has served profiles to an active member
    When the active member interacts with and rates the profiles
    Then the information of the served profiles should be saved in the backend to avoid duplicates.
    And the served profiles should have an expiration period of 14 days.
    And if the active member does not interact with the profiles during the first week, 3 additional profiles should be sent in the second week.
    And if the active member still does not interact with the profiles during the second week, the initial 3 profiles should expire, and 3 new profiles should be sent in the following week.
    And if the person hasn't acted and the served profiles expired, they can be resent.

  Scenario: Algorithm handles the limit of profiles for the active member
    Given that the active member has interacted with the served profiles
    When the active member has reached the limit of 6 profiles displayed in the app
    Then the algorithm should not send new profiles to the active member.

  Scenario: Algorithm ensures uniqueness of profiles
    Given that the algorithm runs and serves profiles to multiple active members
    When profiles are served to each active member
    Then each active member should receive a unique set of profiles each week.

  Scenario: Algorithm manages the weekly limit for approved users
    Given that an approvedProfile user can receive up to 15 accounts per week
    When the algorithm serves approved profiles
    Then the system should save the information for each approved user, including Profile Picture, Name, Age, and Hobby.
    And an approved user should not receive more than 15 accounts per week.
