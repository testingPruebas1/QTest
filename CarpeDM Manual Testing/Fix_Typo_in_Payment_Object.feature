Feature: Fix Typo in Payment Object

    Scenario: Creating Payment array correctly for WRP user
        Given a WRP user
        When the user pays the deposit or a membership
        Then the Payment array should be created correctly with Type: "Payment"

    Scenario: Updating Membership object for WRP user cancellation
        Given a WRP user with a Membership
        When the user cancels the Membership
        Then the Membership object should be updated correctly

    Scenario: Updating new Membership correctly for WRP user with existing Membership
        Given a WRP user with an existing Membership
        When the user wants to get a new Membership
        Then the new Membership should be updated correctly in the user object