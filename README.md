# WhiskyClub Redux

This repository represents a simple whisky catalog application build using the Redux design pattern in SwiftUI. I created this application in order to test the Redux design pattern in a mobile application. With the release of SwiftUI, the latest framework from Apple for building iOS/mac application, I believe that this pattern will start to be used a lot in the mobile applications.

In WWDC2019 Apple emphasized that the view should be a function of a state. I think that Redux perfectly matches that statement.

What I think that are the benefits of this pattern:
* You know every possible state of the application
* You can easily send the app in every state that you want. This can be used a lot while creating tests for the app.
* You can track the user behavior because in every state change you know the current user's state and the action that he has taken. Hypothetically this data you can send it to the backend and train a ML model that will predict the user behavior.
