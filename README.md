# Image Gallery App

iOS Application that fetches images from flickr search and display on a 2 grid view. To run the application, you need to execute $ pod install command and open the imageGallery.xcworkspace generated. Select Scheme imageGallery and run the app.

The application is designed with 
`MVP + Coordinators + Clean Architecture.`

The architecture was divided with the following layers:

* **Presentation Layer:** Coordinators, Factories, Presenters, ViewControllers, TableView and Cells
* **Domain Layer:** Interactors (Responsible for business logic) and Repositories
* **Data layer:** API and Services for network requests

The application is covered by unit tests.

Frameworks adopted:

* **Quick/Nimble:** Used to implement unit tests in a Behavior-driven style
* **Moya:** Used to handle network requests
* **PKHUD:** Used to display HUD on errors
* **SwiftLint:** Used basic sets of rules such as blocking forcecast

## Local Pipeline

A local Continuous Integration pipeline was built to improve the code quality of the project. The automated commands are placed in Makefile You just need to run the command make check.

It runs the following steps in a orderly manner:

Clean Workspace --> Build Workspace --> Unit Testing 

If one of these steps fail, the pipeline will fail as a whole. And, the developer must fix the highlighted problems.

**Ps:** If you don't have some dependencies yet installed. Probably, make check command will fail.

So, just run the command:

make setup

It will install xcpretty and will execute pod install.

The pipeline is set to use iPhone 11 with iOS 14.4 as destination platform.
