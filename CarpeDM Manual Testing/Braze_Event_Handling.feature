Feature: Braze Event Handling

  Scenario: Update user.ProfileStatus to INTERVIEWAPPROVED
    Given the user.ProfileStatus is INTERVIEW
    When the system updates the user.ProfileStatus to INTERVIEWAPPROVED
    Then the system should replace the current braze event approved_post_interview
    And the system should send only the new event to BrazeCustomEvent - Type General
    And the system should trigger a new braze event to create a carousel notification
    
  Scenario: Update user.ProfileStatus to INTERVIEWSKIPPED
    Given the user.ProfileStatus is INTERVIEW
    When the system updates the user.ProfileStatus to INTERVIEWSKIPPED
    Then the system should replace the current braze event approved_post_interview
    And the system should send the new event to BrazeCustomEvent - Type General
    And the system should trigger a new braze event to create a carousel notification
    
    Scenario: Update user.ProfileStatus to PAID
    Given the user.ProfileStatus is BCKCOMPLETED
    When the system updates the user.ProfileStatus to PAID
    Then the system should replace the current braze event membership_payment
    And the system should send the new event to BrazeCustomEvent - Type General