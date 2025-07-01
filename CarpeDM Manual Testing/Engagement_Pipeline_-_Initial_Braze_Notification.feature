Feature: Engagement Pipeline - Initial Braze Notification

Scenario: Applicant receives match offer and redirects to Web Registration Portal
    Given The Matchmaker has selected a "member" for an "applicant"
    When The "applicant_member_match" Braze event is triggered
    Then Send an email to the applicant with:
      | Subject | "You have a potential match on CarpeDM!" |
      | Body    | Includes a "View Candidate" button redirecting to Web Registration Portal |
    And Create a record in the "matches" collection with:
      | Field            | Value     |
      | status           | "Pending" |
      | createdAt        | Current date |
      | notificationSent | 0         |

Scenario: Applicant accepts member after login
    Given The applicant clicks "View Candidate" and is redirected to Web Registration Portal
    And The applicant logs in successfully
    When They select "Accept" in the match interface
    Then Braze triggers the "applicant_member_accept" event
    And Update the record in "matches" with:
      | Field            | Value     |
      | status           | "Accept"  |
      | respondedAt      | Current date |
    And The Matchmaker receives an email with subject: "Applicant has accepted your match"

Scenario: Applicant rejects member after login
    Given The applicant clicks "View Candidate" and is redirected to Web Registration Portal
    And The applicant logs in successfully
    When They select "Reject" in the match interface
    Then Braze triggers the "applicant_member_reject" event
    And Update the record in "matches" with:
      | Field            | Value     |
      | status           | "Reject"  |
      | respondedAt      | Current date |
    And The Matchmaker receives an email with subject: "Applicant has rejected your match"