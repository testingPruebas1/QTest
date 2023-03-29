Feature: [BE] Conversations - Add Sender First and Last name in the SMS text messages

        Currently, if the matchmaker recieves more than 1 message in a conversation, then the BE will send only 1 SMS text message to the matchmaker and then  wait 10 min to send new notifications.

        Requirement: Frequency capping: Send no more than 1 “New Inbox Notification” SMS text message per conversation with the matchmaker.

        New Requirement: Add the First name and Last name in the SMS so the matchmaker knows who sent them a new message.

        Hi [Matchmaker’s first name], you have a new message from [First Name] [Last Name]. Check the CarpeDM Admin Portal to reply.

        Given matchmaker and member have logged in

    Scenario: (AC #1)

        When matchmaker sends a new message to the admin, root admin or matchmaker
        Then notification should be sent via SMS Twilio to the matchmaker that receives the message

        When member sends a new message to the admin, root admin or matchmaker
        Then notification should be sent via SMS Twilio to the matchmaker

    Scenario: (AC#2)

        When other participant sent more than 1 message within 10 minutes
        Then then the BE must send no more than 1 “New Inbox Notification” SMS text message per conversation
        But Only after 10 minutes, if the other particiant sends another message, a new SMS notification will be sent.

    Scenario: (AC#3)

        Then “New Inbox Notification”  is per conversation.

    Scenario: (AC#4)

        Then the  “New Inbox Notification”  must include the Sender FIrst and Last name.

    Scenario: (AC#5)

        Then the new SMS text message must be: Hi [Matchmaker’s first name], you have a new message from [First Name] [Last Name]. Check the CarpeDM Admin Portal to reply.

