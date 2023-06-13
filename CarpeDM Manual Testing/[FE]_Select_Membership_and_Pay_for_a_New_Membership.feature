Feature: [FE] Select Membership and Pay for a New Membership

    Given that the user is in status BCKAPPROVED and they are logged into the WRP, they will see the possible memberships depending on the media gender

Scenario: (#1) Black Female Professionals

    Given that the user is in status BCKAPPROVED and they are logged into the WRP,
    And user is a Black Female Professional.
    And user navigates to member portal, and logs in with her credentials
    And user user chooses Premium Annual, Premium 6 Month or Gallery Annual and Gallery 6 Month plan.
    And user is redirected to the Stripe Page.
    When she completes the credit card information and click on Pay
    Then the payment must be saved in database
    And a new Payment object is created with the User Profile status is updated to PAID
    And user must be redirected to Homescreen
    And Design needs to be responsive

Scenario: (#2) Seeking Black Female Professionals

    Given that the user is in status BCKAPPROVED and they are logged into the WRP,
    And user is seeking to date a Black Female Professional.
    And user navigates to member portal, and logs in with her credentials
    And user user chooses Pool Annual and Pool 6 Month plan.
    And user is redirected to the Stripe Page.
    When he completes the credit card information and click on Pay
    Then the payment must be saved in database
    And a new Payment object is created with the User Profile status is updated to PAID
    And user must be redirected to Homescreen
    And Design needs to be responsive