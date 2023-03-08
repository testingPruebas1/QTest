Feature: Inactive admins and S-Deleted admins should not receive cancel event text message

    If an interview event is canceled from the Admin Portal - Calendar view
    An SMS message is sent to all users with roles 1 and 2
    Except for users who are inactive or deleted.

Scenario: If the admin user is inactive or deleted, then they must not receive the SMS

    When <AdminUser> cancels an "interview" event
    Then an SMS message is sent only to users with roles 1 and 2
    And have their fields IsDeleted: false and Status: 1