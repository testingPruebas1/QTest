Feature: [BE] Create a field in the User Object to save a Discount code

Scenario: (AC#1, AC#2, AC#3, AC#4, AC#5) Collection

Given user runs /api/user/add-discount-code endpoint 



When user checks database

Then user must see that collection "DiscountCode" exists. (AC#1)


When user checks "DiscountCode" collection

Then user must see that the UserID and the code (string) have saved. (AC#2)


When user tries to use other than letters and numbers in the "Code"

Then user must checks that can only use letters and numbers. (AC#3)


When user checks the field saved for endpoint runned.

Then user must see that code and UserID is inserted on "DiscountCode" collection. (AC#4)


When user runs /api/User/get-user-by-id endpoint

Then user must see that the code is exposed. (AC#5)