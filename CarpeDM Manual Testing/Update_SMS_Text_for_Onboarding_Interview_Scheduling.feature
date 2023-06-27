Feature: Update SMS Text for Onboarding Interview Scheduling

  Scenario: Sending SMS to Matchmaker with updated text
    Given a WRP user scheduling an onboarding interview with a matchmaker
    When the user clicks on SCHEDULE
    Then a text SMS message should be sent to the Matchmaker
    And the SMS text should be "Hi [Matchmaker First Name], you have a new member interview scheduled with [Member First and Last Name] on Month Day at XX:XX [am/pm] EST (NOTE: 12 hour format)"

  Scenario: Verifying SMS text for rescheduling with the same matchmaker
    Given a WRP user rescheduling an onboarding interview with the same matchmaker
    When the user clicks on SCHEDULE
    Then a text SMS message should be sent to the Matchmaker
    And the SMS text should be "Hi [Matchmaker First Name], you have a new member interview scheduled with [Member First and Last Name] on Month Day at XX:XX [am/pm] EST (NOTE: 12 hour format)"

  Scenario: Verifying SMS text for rescheduling with a different matchmaker
    Given a WRP user rescheduling an onboarding interview with a different matchmaker
    When the user clicks on SCHEDULE
    Then a text SMS message should be sent to the new Matchmaker
    And the SMS text should be "Hi [New Matchmaker First Name], you have a new member interview scheduled with [Member First and Last Name] on Month Day at XX:XX [am/pm] EST (NOTE: 12 hour format)"

  Scenario: Verifying SMS text for reassignment from the Admin
    Given the Admin reassigns the onboarding interview to a new matchmaker
    When the user clicks on SCHEDULE
    Then a text SMS message should be sent to the new Matchmaker
    And the SMS text should be "Hi [New Matchmaker First Name], you have a new member interview scheduled with [Member First and Last Name] on Month Day at XX:XX [am/pm] EST (NOTE: 12 hour format)"
