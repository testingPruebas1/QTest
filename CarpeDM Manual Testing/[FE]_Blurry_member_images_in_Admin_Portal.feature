Feature: [FE] Blurry member images in Admin Portal

    We are seeing blurry images for some members in the Admin Portal but those same images are clear to the member in the iOS app and when we view the picture through the Cloudinary URL.

    This is a critical bug because our matchmakers are reaching out to the members requesting clearer images and this is causing confusion.



Scenario: (AC#1)User Profile

Given Admin have logged in with his credentials, and navigates to "Pool" screen.

When Admin selects a user picture

And he navigates to profile, trying to see profile picture

Then Admin must see profile picture in high resolution, to recognice the details.


Scenario: (AC#1) Manual match

When Admin selects a user picture, selects Match manually in user's member card

And selects another user of the pool to match.

Then Admin must see profile picture in high resolution, to recognice the details.