Feature: Endpoint to Get BCK Status

  Background:
    Given there is data in the BackgroundCheck collection in the database

  Scenario: Successfully Get BCK Status
    Given a valid UserID
    When the endpoint to get BCK status is called with the valid UserID
    Then the response code should be 200
    And the response should contain the BCK status for the specified UserID

  Scenario: Invalid UserID
    Given an invalid UserID
    When the endpoint to get BCK status is called with the invalid UserID
    Then the response code should be 400 (Bad Request)
    And the response should contain an error message indicating an invalid UserID

  Scenario: Unauthorized Access
    Given an unauthorized request
    When the endpoint to get BCK status is called without proper authorization
    Then the response code should be 401 (Unauthorized)
    And the response should contain an error message indicating unauthorized access

  Scenario: BCK Status Not Found
    Given a valid UserID with no associated BCK status
    When the endpoint to get BCK status is called with the valid UserID
    Then the response code should be 404 (Not Found)
    And the response should contain an error message indicating that the BCK status for the specified UserID was not found

  Scenario: Internal Server Error
    Given a valid request
    When the endpoint to get BCK status is called, but an internal server error occurs
    Then the response code should be 500 (Internal Server Error)
    And the response should contain an error message indicating an internal server error
