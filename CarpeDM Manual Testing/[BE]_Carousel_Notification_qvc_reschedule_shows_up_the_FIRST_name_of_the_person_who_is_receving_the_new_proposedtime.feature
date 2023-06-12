Feature: [BE] Carousel Notification qvc_reschedule shows up the FIRST name of the person who is receving the new proposedtime

    With call reschedule, the other matches name shows up instead of the name of the person rescheduling the call.

Scenario: Reschedule the call

    Given User A have scheduled a call with User B
    When User B reschedules the call with User A
    Then User must see "(User B) rescheduled a date" message