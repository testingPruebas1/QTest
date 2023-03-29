Feature: [BE] Add Pending proposed matches to the endpoint active-member-card-get

    Business request: as an admin or matchmaker, I need to see when a user has seized on a match and we're waiting for the other user to act.

    Request for the BE:

    In the endpoint active-member-card-get, it is needed to return a new array with the “pendingmatches”.

    The  “pendingmatches” includes the matches in statusname: “SeizedMatch” and  IsSeizebyBothUsers= FALSE

    For each match object, the endpoint must return all the match information as in the other arrays

    Scenario: Pending proposed match in active-member-card-get

        Given User A is seized UserB
        And User B is not yet selected any option
        When Admin runs active-member-card-get with User A ID
        Then Admin must see the new array “pendingmatches” (AC#1)

        And Admin must see that “pendingmatches” includes the matches in statusname: “SeizedMatch” and  IsSeizebyBothUsers= FALSE (AC#2)

        And For each match object, the endpoint must return all the match information as in the other arrays. (AC#3)