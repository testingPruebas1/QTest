Feature: [BE] Filter by "LOCATION" is not working

    I need to filter by different distances filters, on Pool

    Scenario:(#1) 20 miles 
        Given Admin logs in admin portal, go to Pool screen, select an Active Member
        And go to the Member Card, select "Manual Match"
        When Admin open Primary Filters and selects "20 miles" on Location filter
        Then Admin must see the users with location within that range.

    Scenario:(#2) 50 miles 
        Given Admin logs in admin portal, go to Pool screen, select an Active Member
        And go to the Member Card, select "Manual Match"
        When Admin open Primary Filters and selects "50 miles" on Location filter
        Then Admin must see the users with location within that range.

    Scenario:(#3) 100 miles 
        Given Admin logs in admin portal, go to Pool screen, select an Active Member
        And go to the Member Card, select "Manual Match"
        When Admin open Primary Filters and selects "100 miles" on Location filter
        Then Admin must see the users with location within that range.

    Scenario:(#4) 200 miles 
        Given Admin logs in admin portal, go to Pool screen, select an Active Member
        And go to the Member Card, select "Manual Match"
        When Admin open Primary Filters and selects "200 miles" on Location filter
        Then Admin must see the users with location within that range.