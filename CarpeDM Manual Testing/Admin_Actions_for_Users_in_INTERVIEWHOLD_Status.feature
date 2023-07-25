Feature: Admin Actions for Users in INTERVIEWHOLD Status

  Background:
    Given an applicant is in status INTERVIEWHOLD
    And I am on the Status tab in the Admin portal for that applicant

  Scenario: Admin can PASS the INTERVIEW for an applicant in INTERVIEWHOLD status
    When I click on the "PASS" button
    Then the user's status should be updated to "PASS"

  Scenario: Admin can NOT PASS the INTERVIEW for an applicant in INTERVIEWHOLD status
    When I click on the "NOT PASS" button
    Then the user's status should be updated to "NOT PASS"

  Scenario: Admin can MARK INTERVIEW AS MISSED for an applicant in INTERVIEWHOLD status
    When I click on the "MISSED" button
    Then the user's status should be updated to "MISSED"