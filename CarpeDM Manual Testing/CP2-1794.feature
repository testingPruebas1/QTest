Feature: 
  Re-match Notification System

  Scenario: Send SMS notification on re-match creation
    Given two users have a previous match expired in initial
    When User A runs /api/Match/add-rematches with USER A & USER B IDs (AC#1)
    Then the system sends a SMS text message to the matchmaker assigned to both matches (User A and User  B ).
    
    When the system sends a SMS text message (AC#2)
    Then the SMS text message contains the other match first and last name.
    
    And the format is "Text:  “Hi [Matchmaker first name], [Matchmaker A]’s member [full name] just rematched with [Matchmaker B]’s member [full name].”" (AC #3)

    And the SMS text message is sent to the matchmaker assigned to each user in the match: User A and User  B; AND also to all users with Role "id": "1",     "name": "RootAdmin".(AC#4)
    

  Scenario: Do not send duplicate SMS notifications
    Given two users have a previous match expired in initial
    And userA’s matchmaker is also a user with Role “id” 1 
    When User runs /api/Match/add-rematches with USER A & USER B IDs
    Then the SMS text message is sent only once to this matchmaker.(AC#5)
    
    
  Scenario: Avoid displaying matchmaker name twice in SMS notification
    Given the root admin or matchmaker that receives the message is the same of any of the [Matchmaker]’s included in the message “[Matchmaker A]’s member [full name] just rematched with [Matchmaker B]’s member [full name].”
    When User runs /api/Match/add-rematches with USER A & USER B IDs
    Then the name is not displayed twice and the text is replaced by “your member [full name]”(AC#6)