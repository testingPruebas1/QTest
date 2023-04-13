Feature: [BE] New Match reminder to served users that have not taken an action yet

    Create 3 new custom events for when a user is served a match (algorithm or matchmaker) but doesn't take an action (user doesn't seize or pass) 12 hours after the match is served, 36 hours after the match is served and 47 hours after the match is served.

    Event names: new_match_reminder_12; new_match_reminder_36; new_match_reminder_47

    Scenario: (#1) User A and User B served an initial match. Both user match objects are in ProposedMatch.

        Given User A and User B have StatusName: "ProposedMatch"
        And both are served in initial match

        When 12 hours pass after the match object is created
        Then User A and User B recieves new_match_reminder_12 Braze notification. (AC#1)

        When 36 hours pass after the match object is created
        Then User A and User B recieves new_match_reminder_36 Braze notification. (AC#2)

        When 47 hours pass after the match object is created
        Then User A and User B recieves new_match_reminder_47 Braze notification. (AC#3)

    Scenario: (#2) User A and User B served an initial match. But User A is SeizedMatch

        Given User B have StatusName: "ProposedMatch"
        But User A have StatusName: "SeizedMatch"
        And both are served in initial match

        When 12 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_12 Braze notification and User B recieves it. (AC#1)

        When 36 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_36 Braze notification and User B recieves it. (AC#2)

        When 47 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_47 Braze notification and User B recieves it. (AC#3)

    Scenario: (#3) User A and User B served an initial match. But User A is PassedMatch

        Given User B have StatusName: "ProposedMatch"
        But User A have StatusName: "PassedMatch"
        And both are served in initial match

        When 12 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_12 Braze notification and User B recieves it. (AC#1)

        When 36 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_36 Braze notification and User B recieves it. (AC#2)

        When 47 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_47 Braze notification and User B recieves it. (AC#3)

    Scenario: (#4) User A and User B served an initial match. But User A is RemainMatch

        Given User B have StatusName: "ProposedMatch"
        But User A have StatusName: "RemainMatch"
        And both are served in initial match

        When 12 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_12 Braze notification and User B recieves it. (AC#1)

        When 36 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_36 Braze notification and User B recieves it. (AC#2)

        When 47 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_47 Braze notification and User B recieves it. (AC#3)

    Scenario: (#5) User A and User B served an initial match. But User A is UnmatchedMatch

        Given User B have StatusName: "ProposedMatch"
        But User A have StatusName: "UnmatchedMatch"
        And both are served in initial match

        When 12 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_12 Braze notification and User B recieves it. (AC#1)

        When 36 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_36 Braze notification and User B recieves it. (AC#2)

        When 47 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_47 Braze notification and User B recieves it. (AC#3)

    Scenario: (#6) User A and User B served an initial match. But User A is ReportedMatch

        Given User B have StatusName: "ProposedMatch"
        But User A have StatusName: "ReportedMatch"
        And both are served in initial match

        When 12 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_12 Braze notification and User B recieves it. (AC#1)

        When 36 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_36 Braze notification and User B recieves it. (AC#2)

        When 47 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_47 Braze notification and User B recieves it. (AC#3)

    Scenario: (#7) User A and User B served an initial match. But User A is SeizedAfterPass

        Given User B have StatusName: "ProposedMatch"
        But User A have StatusName: "ReportedMatch"
        And both are served in initial match

        When 12 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_12 Braze notification and User B recieves it. (AC#1)

        When 36 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_36 Braze notification and User B recieves it. (AC#2)

        When 47 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_47 Braze notification and User B recieves it. (AC#3)

    Scenario: (#8) User A and User B served an initial match. But User A is PassedByMatch

        Given User B have StatusName: "ProposedMatch"
        But User A have StatusName: "PassedByMatch"
        And both are served in initial match

        When 12 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_12 Braze notification and User B recieves it. (AC#1)

        When 36 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_36 Braze notification and User B recieves it. (AC#2)

        When 47 hours pass after the match object is created
        Then User A don't recieves new_match_reminder_47 Braze notification and User B recieves it. (AC#3)
