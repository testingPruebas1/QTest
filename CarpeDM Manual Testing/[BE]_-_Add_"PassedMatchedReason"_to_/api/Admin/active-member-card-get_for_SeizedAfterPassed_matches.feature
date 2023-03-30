Feature: [BE] - Add "PassedMatchedReason" to /api/Admin/active-member-card-get for SeizedAfterPassed matches


    Scenario: PassedMatchedReason on /api/Admin/active-member-card-get when SeizedAfterPassed matches

        Given that User A passed on User B
        And User B likes User A
        And User B match status with User A is in SeizedAfterPass

        When Admin runs /api/Admin/active-member-card-get with User B ID
        Then User A must be returned under the colection “SeizedAfterPass” with the PassedMatchedReason contained in this match object.