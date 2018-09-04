# Root Code Test - Michael McKinney

### Abstract
As an iOS engineer, when presenting my own programming, I prefer to showcase a complete, production quality application. In the case of the Root programming test, I've made a simple iOS app that follows industry standards for general architecture, code documentation and testing. 

From an architectural standpoint, the application here follows MVVM (Model, View, View Model). By choosing MVVM, I avoid a common pitfall of iOS application design where one class, often the view model, becomes monolithic and encompasses every bit of logic. However, via MVVM, the application is easily split into separate pieces, each with a single responsibility. The three primary classes that make up the app are the `Driver`(Model), the `RCTMainViewController`(View) and the `RCTMainViewModel` (View Model). 

- Since I am applying as an iOS engineer I made a simple mobile front end.
	included several controls for a rapid development cycle

- Designed the app using MVVM architecture pattern
	- This is the ideal way to create a sustainable application
	- With this architecture pattern this splits the application into three main parts
		- The View controller -> the UI view and controller logic
		- The Data Model -> the Driver, the container for any data we need to keep track of while the application runs. 
		- The View Model -> This is the interaction layer between the UI and the data model. Any logic that the UI needed to properly update is performed by the view model.
		
- The View Controller
	The view controller is the simplest of the architecture's layers. It initializes the user interface, sends data to the view model layer, and presents alerts when input fails validation
	
- The View Model
	Validation

- The Model (class)
	While Structs in swift are less computationally expensive, Drivers need to be passed through the app by reference. Thus I chose to represent a driver as a class.
	
- Testing
	My testing approach covers unit testing a brief test of the UI layer to ensure that it has properly initialized
	Unit tests encompass the support structure of the application such as user input validation, the main algorithm, and general functionality of the data model layer
	
