Feature: Failed Payment Process for Membership

  Scenario: User attempts to complete payment process but payment fails
    Given the User is in the status INTERVIEWAPPROVED or INTERVIEWSKIPPED
    And the User clicks the "Pay Now" button after choosing a membership
    When UserA is redirected to the Chargebee payment form
    Then a Customer is immediately created in Chargebee
    And User clicks on the "Proceed To Checkout" button to fill out the payment form
    And User chooses the "Card" method (other methods available are "Google Pay" and "Apple Pay" when using Safari)
    And User fills out the payment information
    And User clicks on the "Pay $xxx & subscribe" button
    Then User sees an error message indicating the payment could not be processed due to issues with the card (e.g., insufficient funds, expired card, or other problems)
    And the profile status of UserA remains unchanged
    And the UserMatches object is not created
    And the subscription is not created in Chargebee
    And only the Customer is created in Chargebee without any additional data
