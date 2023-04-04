Feature: [BE] REMAINDER | Push notifications reminder for qualified video calls

    CONDITIONS:

    StatusName:"SeizedMatch"
    IsSeizedByBothUsers: true
    CallStatusName:"Scheduled"




    It is related to the qualified video calls between 2 members that indicated interest (seize), and that have scheduled a call. This call information is included in the match object between those 2 users, and you will find there the AvailableDateTime. If the CallStatusName is SCHEDULED, then 5 minutes before the  AvailableDateTime the backend should trigger a braze event, so then the push notification is sent to the user with a reminder.

    :warning: This reminder will be particular for each user, one for which I program, and another for which I accept.

    Scenario: User A notifications

        Given User A and User B have StatusName:"SeizedMatch" and both have IsSeizedByBothUsers: "true"
        And CallStatusName:"Scheduled"

        When User A checks the field ProposedByUserId inside CallInformation.
        Then User A should see their ID (AC#1)

        When lacks 5 minutes for the interview
        Then User A must recieve a push notification with a reminder to call UserB
        And User A must trigger the Event 1 to user who should initiate call "initiate_call_reminder" (AC#2)

    Scenario: User B notifications

        When  User B accepts the call
        Then User B will recieve a push notification with a reminder for wait the call by UserA (AC#3)

        And must recievetrigger Event 2 to user receiving call "receive_call_reminder" (AC#4)