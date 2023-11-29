Feature: 
  Background Check Status Update

  Scenario: Update user field IsBackGroundCheckCompleted to TRUE upon approval
    Given the Karmacheck case is completed and approved
    When the user field IsBackGroundCheckCompleted is updated
    Then the User.ProfileStatus should not be updated (AC#1)
    And push notification and carousel events should be triggered for approval(AC#4)

  Scenario: Update user field IsBackGroundCheckCompleted to TRUE upon rejection
    Given the Karmacheck case is completed and rejected
    When the user field IsBackGroundCheckCompleted is updated
    Then the User.ProfileStatus should not be updated (AC#2)
    And push notification and carousel events should be triggered for rejection(AC#4)
    
  Scenario: Verify Backgroundcheck collection for approval
    Given the Karmacheck case is completed and approved
    When the user field IsBackGroundCheckCompleted is updated
    Then the event for approval should be created in Backgroundcheck collection(AC#3)
 
  Scenario: Verify Backgroundcheck collection for rejection
    Given the Karmacheck case is completed and rejected
    When the user field IsBackGroundCheckCompleted is updated
    Then the event for rejection should be created in the Backgroundcheck collection(AC#3)