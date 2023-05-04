Feature: [FE] Load all members under "MyMembers" in Contacts

        Description

        Given that the matchmaker is in the Inbox screen and has selected “MyMembers” in the filter, then all members assigned to this matchmaker and status PAID must be listed.

    If the matchmaker has more than 30 active members assigned, then they must be able to see all of them when they filter by “My Members”.

    Currently, the FE is using the endpoint Admin/search-paginated-contacts, and it is displaying the first 30 results (page 1).

    Scenario: PAID filter

        Given the user navigates to the Inbox screen and selects 'MyMembers' from the filter
        When the user filters their selection to show only paid members
        Then all paid members assigned to the matchmaker should be listed
        And if there are more than 30 paid members, they should all be visible without needing to navigate to additional pages