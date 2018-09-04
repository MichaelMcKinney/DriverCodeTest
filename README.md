# Root Code Test - Michael McKinney

### Abstract
As an iOS engineer, when presenting my own programming, I prefer to showcase a complete, production quality application. In the case of the Root programming test, I've made a simple iOS app that follows industry standards for general architecture, code documentation and testing. 

From an architectural standpoint, the application here follows MVVM (Model, View, View Model). By choosing MVVM, I avoid a common pitfall of iOS application design where one class, often the view model, becomes monolithic and encompasses every bit of logic. However, via MVVM, the application is easily split into separate pieces, each with a single responsibility. This siloed design allows the code to be easily understood by new developers, allows for more reapid development and most importantly can be easily unit tested. The three primary classes that make up the app are the `Driver`(Model), the `RCTMainViewController`(View) and the `RCTMainViewModel` (View Model). 

### View Controller
The first, and most basic layer in Root Code Test(RCT) is the View Controller or in MVVM the "View." This houses any user interface elements, communicates with the user and sends any relevant data back to the View Model for processing. In this example, `RCTMainViewController` is as foundational as a UI can be. It is initialized from an iOS storyboard file where most of the UI's work is performed. From there it is separated out into a handful of buttons that load data, analyze the data, and reset any user interactions. Worth noting in this class is the `PresentAlert` function. Here, the View Controller's View Model can signal to the parent View Controller that there was an error with user input and gracefully handle any exceptions that would otherwise have occurred. With such a bare View Controller, the UI can be easily initialized and managed, without any unnecessary logic. 

### View Model
When the View Controller is given user input that needs to be processed, it sends the input down a layer to the View Model or in this case `RCTMainViewModel`. `RCTMainViewModel` is a Swift class that stores any relevant data, manipulates it, and ultimately sends the results back to the View Controller. 

When user input is sent to the View Model it is first parsed into recognizable commands. Along the way, the input goes through a series of checks to ensure that it conforms to the protocol the algorithm is expecting. If it doesn't, the process is terminated and the user is alerted of their error. Once parsed and validated a stored array of `Driver` objects is modified. These `Driver` objects house each Driver's ongoing trip records. While the View Model handles the user input, the `Driver` objects are where the main algorithm is performed. After each line of user input has been addressed, a text string is prepared with the results and sent to the View Controller to be displayed. 

The View Model is home to a large amount of validation logic and data preparation methods. This is because the View Model's role is a middle ground between the UI and the data layer. It modifies inputs and outputs in such a way that the highest and lowest levels of the architecture can communicate. However, since the actual trip data is intended for Drivers, the mathematics and algorithm are on the Model layer with the `Driver` object.

### Model
The third and final architecture layer is the data model, or `Driver`. This is where the primary logic of the app lives and where any primitive data is manipulated. Here, Drivers are represented by a class, despite structs being less computationally expensive. This is because while the Drivers are being passed around within the View Model, they need to be passed by reference, something not supported in Swift's structs. Ultimately, the `Driver` class is relatively simple. The `Driver`'s responsibility in the app is to store a `Name`, a `Speed` and a `Distance` and perform a few methods on those properties. The largest of the methods is the main algorithm. This is performed as one would expect, and simply takes the user input to find a new total driver distance and average speed. The other method acts to prepare a summary string that will ultimately be presented to the user for that driver. Both methods are called only by the View Model, again emphasizing the principles of MVVM.

### Testing
While not a layer in MVVM, testing is an essential aspect in any software project.

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
	
