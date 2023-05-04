Feature: [FE] Remove photos from Cloudinary when the Admin user changes the profile picture

        Given that the admin user goes to “My Profile” and clicks on the pencil icon to edit or upload new picture in the profile picture, once they save the new picture or the edited picture then the previous image is deleted form Cloudinary; and only the current profile picture should be keep in Cloudinary

    Scenario: Remove photos from Cloudinary

        Given the user navigates to 'My Profile' and clicks on the pencil icon to edit or upload a new picture
        When the user saves the changes to their profile picture
        Then the previous profile picture should be deleted from Cloudinary
        And only the updated profile picture should remain in Cloudinary