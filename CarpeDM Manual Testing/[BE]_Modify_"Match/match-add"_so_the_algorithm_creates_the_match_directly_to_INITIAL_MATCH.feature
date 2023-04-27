Feature: [BE] Modify "Match/match-add" so the algorithm creates the match directly to INITIAL MATCH

        Currently, when the algorithm creates a match between 2 active members, then the BE creates the match object for each user in status ProposedMatch. This needs to be changed to create the matches directly in status INITIAL MATCH.

        AC

        Given that the algorithm creates a match between 2 profiles, then the match must be created in status SEIZEDMATCH and IsSeizedByBothUsers in TRUE, so then the active members have to schedule the qualifying video call before accepting or rejecting the match.


    Scenario: (#1) Match between users

        Given Admin have logged on Swagger
        And User A and User B are active members, and they don't have any matches between them
        When Admin runs Match/match-add, with 2 UserIDs

        Then BE will create a match object in status SEIZEDMATCH and IsSeizedByBothUsers in TRUE; with matchtype 1 (AC#1)

        Then InitialMatchExpires will be populated with current date + 72 hours (as it is done in the SiezeMethod when MatchUserA is already in Seize and the flag “IsSeizedByBothUsers” is updated to TRUE) (AC#2)

        Then the MatchExpires will not be used anymore in this manual match process, and will not be populated with any date.(AC#3)

        Then the BE will send a braze custom event: new_ algorithm_match to both users.(AC#4)

    Scenario: (#2) One user is HighProfile

        Given User A is HighProfile
        And User A and User B are active members, and they don't have any matches between them
        When Admin runs Match/match-add, with 2 UserIDs

        Then the BE will trigger an additional custom braze event: high_profile_nda (AC#1)

    Scenario: (#3) Both users are HighProfile

        Given User A and User B are HighProfile
        And User A and User B are active members, and they don't have any matches between them
        When Admin runs Match/match-add, with 2 UserIDs

        Then both users in the match will receive this additional custom braze event: high_profile_nda (AC#1)