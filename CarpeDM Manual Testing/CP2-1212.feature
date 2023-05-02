Feature: [BE] Send email when an application requires review in the Karmacheck dashboard

    Description

    The system must send an email to Ask@carpedmdating.com when the webhook receives a case in status: "caseStatus": “Complete” & "secondaryStatus": "Consider".

    Scenario: Notification email is sent when a case is completed and has "Consider" secondary status
        Given the webhook system is monitoring the case status changes
        And there is a completed case with secondary status "Consider"
        When the system detects the completed case with "Consider" secondary status
        Then the system should send an email to Ask@carpedmdating.com
        And the email should have the subject "Application needs review in the Karmacheck dashboard"
        And the email body should contain the following text:
            """
            Hi CarpeDM Team!

            Karmacheck found something that the CarpeDM team needs to check for the following user:

            [User First and Last Name] - [EmailAddress]

            """