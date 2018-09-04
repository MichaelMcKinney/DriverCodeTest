# Root Code Test - Michael McKinney

### Abstract
As an iOS engineer, when presenting my own programming, I prefer to showcase a complete, production quality application. In the case of the Root programming test, I've made a simple iOS app that follows industry standards for general architecture, code documentation and testing. 

From an architectural standpoint, the application here follows MVVM (Model, View, View Model). By choosing MVVM, I avoid a common pitfall of iOS application design where one class, often the view controller, becomes monolithic and encompasses every bit of logic. However, via MVVM, the application is split into separate pieces, each with a single responsibility. This siloed design allows the code to be understood by new developers, to facilitate more rapid development and most importantly to be easily unit tested. The three primary classes that make up the app are the `Driver`(Model), the `RCTMainViewController`(View) and the `RCTMainViewModel` (View Model). 

### View Controller
The first, and most basic layer in Root Code Test(RCT) is the view controller or in MVVM the "View." This houses any user interface elements, communicates with the user and sends relevant data back to the view model for processing. In this example, `RCTMainViewController` is as foundational as a UI can be. It is initialized from an iOS storyboard file where most of the UI's work is performed. The UI is composed of a handful of buttons that load data, analyze the data, and reset any user interactions. Worth noting in this class is the `PresentAlert` function. Here, the view model can signal to the parent view controller that there was an error with the user's input and gracefully handle any exceptions that would otherwise have occurred. With such a bare view controller, the UI is easily managed without any unnecessary logic. 

### View Model
When the view controller is given user input for processing, it sends the input down a layer to the view model or in this case `RCTMainViewModel`. `RCTMainViewModel` is a Swift class that stores any relevant data, manipulates it, and ultimately sends the results back to the view controller. 

Incoming input is first parsed into recognizable commands. Along the way, it goes through a series of checks to ensure that it conforms to the protocol the algorithm is expecting. If it doesn't, the process is terminated and the user is alerted of their input error. Once parsed and validated, a stored array of `Driver` objects is modified. These `Driver` objects contain each driver's ongoing trip records. While the view model handles the user input, to adhere to MVVM, the `Driver` objects are where the main algorithm is performed. After each line of user input has been addressed, a text string is prepared with the results and sent to the view controller to be displayed. 

`RCTMainViewModel` is home to validation logic and data preparation methods. This is because the view model's role is a middle ground between the UI and the data layer. It modifies inputs and outputs in such a way that the highest and lowest levels of the architecture can communicate. However, since the actual trip data is intended for drivers, the mathematics and algorithm are on the model layer with the `Driver` object.

### Model
The third and final architecture layer is the data model, or `Driver`. This is where the primary logic of the app lives and where any primitive data is manipulated. Here, drivers are represented by a class, despite Swift structs being less computationally expensive. This is because while the `Drivers` are being passed around within the view model, they need to be passed by reference, something not supported in Swift's structs. Fundamentally, the `Driver` class is relatively simple. The `Driver`'s responsibility in the app is to store a `Name`, a `Speed` and a `Distance` and perform a few methods on those properties. The largest of the methods is the main algorithm. This is performed as one would expect, and takes the user input to find a new total driver distance and average speed. The only other other method in `Driver` acts to prepare a summary string that will be presented to the user for that driver. Both methods are called only by `RCTMainViewModel`, again emphasizing the principles of MVVM.

### Testing
While not a layer in MVVM, testing is an essential aspect in any software project. I kept the testing aspect uncomplicated and employed both unit testing and UI testing. Because `RCTMainViewController` is so basic, I only test to ensure it has initialized properly and that all UI components are presented on screen. My unit testing is more comprehensive. It looks at each class's initialization programmatically and the primary methods within each class. Here those are the `Driver`'s string summary and mathmatical algorithm. Also, the validation and string manipulation functions of the view model are tested. Ultimately, while the application is small, the testing layer is still required and, when frequently ran during development, can catch errors early on before they become large-scale problems.
	
