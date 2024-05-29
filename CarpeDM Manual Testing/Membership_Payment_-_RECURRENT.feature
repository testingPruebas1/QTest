Feature: Membership Payment - RECURRENT

  Context:
    Given a user is in the INTERVIEWAPPROVED or INTERVIEWSKIPPED profile status

  Context Schema:
    When a user chooses to pay a membership with a RECURRENT payment type

  Scenario: RECURRENT membership payment
    Given a user wants to pay their membership with a RECURRENT payment
    When the user enters the necessary information and completes the payment
    Then the User.ProfileStatus.Key field should be updated to "PAID"
    And the Membership object in User.Membership should be updated with detailed membership information, including title, membership type, etc.
    And the User.Membership.Status field should be updated to "Active"
    And the User.Membership.CustomerId field should be updated correctly with a unique identifier
    And a Payment object should be created in the User.Membership.Payments[] array with corresponding information, including last payment date, next payment date, and action date
    And the User.Membership.Payments.PriceType and User.Membership.Payments.PriceTypeName fields should be updated to 1 and "RECURRENT" respectively
    And there should be an object created in the UserMatches collection with membership information, including available matches to serve and their respective dates
