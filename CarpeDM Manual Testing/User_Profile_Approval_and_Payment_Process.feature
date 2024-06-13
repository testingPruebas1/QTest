Feature: User Profile Approval and Payment Process

  Background:
    Given the user is on the Status screen of a user's profile

  Scenario: Approve user profile and handle payment successfully
    Given the user's profile state is "SUBMITTED" or "HOLD"
    When the admin clicks on the "APPROVE" button
    Then the user's profile state should be updated to "APPROVED"
    And a custom event "new_profile_approved" is sent to Braze

    Given the approved user is on the old interface for deposit payment
    When the user clicks on the "Pay Deposit" button
    Then the user should be redirected to the payment form on the new Chargebee platform
    And the user successfully completes the payment
    Then the user's profile state should be updated to "INTERVIEW"
    And the Membership object should be updated
    And a custom event "deposit_status" is sent to Braze

  Scenario: Payment failure scenario
    Given the user's profile state is "APPROVED"
    When the user clicks on the "Pay Deposit" button
    And the user is redirected to the payment form on the new Chargebee platform
    And the payment fails due to a card issue, payment method problem, or an internal problem in Chargebee or our Backend
    Then the user's profile state should remain "APPROVED"
    And the user should not be able to proceed to the interview with the matchmaker
    And the user should be required to retry the deposit payment process
