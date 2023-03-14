Feature: [Prod Issue] Interview scheduled by Darrah was not created in the Calendar in the DB

    {EmailAddress: 'darrahjoyclay@gmail.com'}
    The user scheduled an interview yesterday about 1.30 EST, but the interview was not saved in the collection.Calendar. 

    The matchmaker Monique received the SMS text message with the new interview details. And the event was created in Google calendar. 

    There are no events for this user in this collection

Scenario: Interview scheduled by WRP user

    Given WRP user have logged in

    When WRP user schedules an interview with Admin

    Then WRP user must see that the interview is created in "Calendar" collection.

    And Admin must recieve the SMS text message with the new interview details. And the event was created in Google calendar.

Scenario: Interview scheduled by Admin

    Given Admin have logged in

    When Admin schedules an interview with WRP user

    Then Admin must see that the interview is created in "Calendar" collection