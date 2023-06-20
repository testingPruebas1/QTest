Feature: User Payment Flow

  Scenario: #1 User clicks on "Pay Deposit" button and is redirected to the Stripe screen
    Given the user is in "APPROVED" status
    When the user clicks on "Pay Deposit"
    Then the Stripe screen should be displayed

  Scenario: #2 User completes credit card information and successfully makes the payment
    Given the user is in "APPROVED" status
    And the Stripe screen is displayed
    When the user completes the credit card information
    And clicks on "Pay"
    Then the payment should be saved in the database
    And a new Payment object should be created
    And the user status should be updated to "INTERVIEWPAID"
    And the user should be redirected to the Home Screen in WRP

  Scenario: #3 User cancels the payment process
    Given the user is in "APPROVED" status
    And the Stripe screen is displayed
    When the user clicks on "Cancel" or closes the Stripe screen
    Then the payment process should be cancelled
    And no payment should be saved in the database
    And the user status should remain "APPROVED"
    And the user should stay on the same page

  Scenario: #4 User session times out during the payment process
    Given the user is in "APPROVED" status
    And the Stripe screen is displayed
    When the user's session times out
    Then the user should be logged out
    And no payment should be saved in the database
    And the user status should remain "APPROVED"
    And the user should be redirected to the login screen
