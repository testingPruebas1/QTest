Feature: Displaying User Information in WRP

  Scenario: Displaying Membership Type and Renewal Date for Active Member
    Given an Active Member in PAID status, logged into the WRP
    When the user views their home screen
    Then the user should see the Membership Type and Renewal Date as "Your [Premium] Subscription will auto renew on [Date]"

  Scenario: Displaying Background Check Status for Active Member
    Given an Active Member in PAID status, logged into the WRP
    When the user views their home screen
    Then the user should see the Background Check Status as per the mockup

  Scenario: Displaying Link to Download the App for Active Member
    Given an Active Member in PAID status, logged into the WRP
    When the user views their home screen
    Then the user should see a link to download the App

  Scenario: Displaying Matchmaker Information for Active Member
    Given an Active Member in PAID status, logged into the WRP
    When the user views their home screen
    Then the user should see the matchmaker information as per the mockup

  Scenario: Redirecting to Community Guidelines
    Given an Active Member in PAID status, logged into the WRP
    When the user clicks on "Community Guidelines"
    Then the user should be redirected to the Community Guidelines page

  Scenario: Verifying responsive design
    Given an Active Member in PAID status, logged into the WRP
    When the user views their home screen on different screen sizes
    Then the design should be responsive and adapt to the screen size
