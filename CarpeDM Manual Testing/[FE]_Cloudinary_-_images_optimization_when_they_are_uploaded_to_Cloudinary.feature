Feature: [FE] Cloudinary - images optimization when they are uploaded to Cloudinary

    Implement image optimizations when the WRP users upload a new picture in the Media Section, or Admins upload profile picture in the admin portal; to save bandwidth and improve performance.

    For example, accessing original images without any transformation is responsible for 80% of your bandwidth usage. If possible, specify image dimensions to match the actual view size.

    See in the email for more details

    Scenario: (#1) WRP user upload a new picture

        Given WRP user is in INTIAL or AMEND status

        When WRP user navigates to Media section
        And he upload, edit, rotate, etc; an image

        Then WRP must see that the flow is working correctly (AC#1)

        Then WRP user must see that in Cloudinary, the file weight is reduced and the sizewill be also fixed (max 1000 px). (AC#2)

        Then images must be displayed ok in the admin portal, with  good quality and not bluered (AC#3)

        Then WRP user must see that in Cloudinary, images from QA are in different folders than Production. (AC#4)