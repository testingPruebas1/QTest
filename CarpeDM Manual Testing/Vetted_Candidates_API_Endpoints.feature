Feature: Vetted Candidates API Endpoints

# POST /api/User/vetted-candidates/{userId}
Scenario: Successfully add new vetted candidate to VettedCandidates collection
    Given User with ID "{userId}" exists in the system
    And No record exists in VettedCandidates for (userId: "{userId}", candidateId: "can123")
    When POST request is made to /api/User/vetted-candidates/{userId} with body:
      """
      {
        "candidateId": "can123",
        "status": 1
      }
      """
    Then Response status should be 200
    And VettedCandidates collection must contain EXACTLY 1 record with:
      | userId      | "{userId}" |
      | candidateId | "can123"   |
      | status      | 1          |
      | createdAt   | current date |

Scenario: Update existing candidate status in VettedCandidates
    Given VettedCandidates collection contains:
      | userId | candidateId | status | createdAt          |
      | "user1"| "can456"    | 1      | "2024-01-01T00:00"|
    When POST request updates status to 2
    Then VettedCandidates collection must update ONLY:
      | status | 2          |
      | updatedAt | current date |
    And Preserve original values for:
      | userId | candidateId | createdAt |

Scenario: Attempt to add invalid status value
    Given Valid authentication credentials
    When POST request is made with invalid status:
      | candidateId | status |
      | "can123"    | 4      |
    Then Response status should be 400
    And Response should contain: "Invalid status value. Valid values: 1, 2, 3"

# GET /api/User/vetted-candidates/{userId}
Scenario: Retrieve filtered candidates from VettedCandidates (Status 1)
    Given VettedCandidates collection contains:
      | userId | candidateId | firstName | status |
      | "userA"| "can001"    | "Ana"     | 1      |
      | "userA"| "can002"    | "Luis"    | 2      |
      | "userB"| "can003"    | "Marta"   | 1      |
    When GET request is made to /api/User/vetted-candidates/userA?status=1
    Then Response should be JSON array with 1 item
    And Response should contain:
      """
      {
        "userId": "userA",
        "candidateId": "can001",
        "firstName": "Ana",
        "status": 1
      }
      """
    And VettedCandidates collection must remain unchanged

Scenario: Empty result set from VettedCandidates
    Given No records in VettedCandidates for userId "userX"
    When GET request is made to /api/User/vetted-candidates/userX
    Then Response should be empty JSON array []

# DELETE /api/User/vetted-candidates/{userId}/candidates/{candidateId}
Scenario: Physically remove record from VettedCandidates
    Given VettedCandidates collection contains:
      | userId | candidateId |
      | "userX"| "can789"    |
    When DELETE request is made to /api/User/vetted-candidates/userX/candidates/can789
    Then VettedCandidates collection must NOT contain:
      | userId | candidateId |
      | "userX"| "can789"    |
    And Response should include:
      """
      {
        "message": "Record removed from VettedCandidates",
        "deletedCount": 1
      }
      """

Scenario: Attempt to delete non-existent record
    Given No record exists for (userId: "userY", candidateId: "can999")
    When DELETE request is made
    Then Response status should be 200
    And Response should contain: "Candidate not found in VettedCandidates"

# Collection-specific validations
Scenario: Verify VettedCandidates document structure
    Given A new record in VettedCandidates
    Then Document must have fields:
      | Field         | Type        | Required |
      | _id           | ObjectId    | yes      |
      | userId        | string      | yes      |
      | candidateId   | string      | yes      |
      | status        | number      | yes      |
      | createdAt     | ISODate     | yes      |
      | updatedAt     | ISODate     | no       |

Scenario: Prevent duplicates in VettedCandidates
    Given VettedCandidates contains {userId: "user1", candidateId: "can123"}
    When Attempting to create duplicate record
    Then Database must reject with duplicate key error
    And Response status should be 400

# Error scenarios
Scenario: VettedCandidates collection unavailable
    Given Database connection error
    When Any API request is made
    Then Response status should be 500
    And Response should contain: "Error accessing VettedCandidates collection"

Scenario: Unauthorized access attempt
    Given Invalid or missing authentication token
    When POST request is made
    Then Response status should be 401
    And Response should contain: "Authentication required"