Feature: Payment Process for Membership

  Scenario: User completes payment process and gets subscription activated
    Given User clicks the "Pay Now" button after choosing a membership
    When UserA is redirected to the Chargebee payment form
    Then a Customer is immediately created in Chargebee
    And UserA clicks on the "Proceed To Checkout" button to fill out the payment form
    And UserA chooses the "Card" method (other methods available are "Google Pay" and "Apple Pay" when using Safari)
    And UserA fills out the payment information
    And UserA clicks on the "Pay $xxx & subscribe" button
    Then UserA is redirected to the dashboard of the Web Registration Portal with profile status PAID
    And the corresponding subscription is created in Chargebee associated with the existing Customer
    And the subscription is reflected in the CarpeDM database
    And a UserMatches object is created for UserA
    And the Membership object within the User object is updated
    And the profile status of UserA is updated to "PAID"
