# SimpleKeyboard

![Swift](https://img.shields.io/badge/Swift-3.0-brightgreen.svg)
[![Version](https://img.shields.io/cocoapods/v/SimpleKeyboard.svg?style=flat)](http://cocoapods.org/pods/SimpleKeyboard)
[![License](https://img.shields.io/cocoapods/l/SimpleKeyboard.svg?style=flat)](http://cocoapods.org/pods/SimpleKeyboard)
[![Platform](https://img.shields.io/cocoapods/p/SimpleKeyboard.svg?style=flat)](http://cocoapods.org/pods/SimpleKeyboard)

SimpleKeyboard addresses a very common problem on the iOS platform: when the keyboard is shown, it can happen that the input field under it is not visible anymore. Since there is no simple or out-of-the-box general solution for this, SimpleKeyboard attempts to provide exactly that.

What makes SimpleKeyboard simple is the fact it works in every View Controller without requiring UIScrollView, AutoLayout, bottom-constraint or any other stuff that is present in different other solutions.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**Using UIScrollView**

![ScrollView](https://github.com/sivu22/SimpleKeyboard/blob/master/Screenshots/ScrollView.gif)

**Login screen with bottom constraint**

![Login](https://github.com/sivu22/SimpleKeyboard/blob/master/Screenshots/Login.gif)

**TableView with cell containing UITextField**

![TableView](https://github.com/sivu22/SimpleKeyboard/blob/master/Screenshots/TableView.gif)

## Usage

SimpleKeyboard is designed for flexibility, that's why there are 3 ways you can use it:
- **Automatic**: takes away all the delegate/keyboard code from your ViewController. You just specify or configure the IBOutlets and you're done. 
- **Manual**: you have full control over all UITextField/UITextView in the ViewController. The keyboard still works nicely, but you have to notify SimpleKeyboard of the current input control.
- **Combined**: SimpleKeyboard will manage some of the input controls for you, while the rest are left in your care.

### Creation
First of all, import SimpleKeyboard into your View Controller and declare a new variable
```swift
var simpleKeyboard: SimpleKeyboard!
```

Now create the keyboard object in onViewDidLoad
```swift
override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleKeyboard = SimpleKeyboard.createKeyboard(forControls: [firstTextField, secondTextField, 
                                                                     firstTextView, thirdTextField], 
                                                       fromViewController: self)
    }
```

If there's a need for a keyboard toolbar for a specific control (on a UITextView or a numeric keyboard), use the add function to let SimpleKeyboard manage it for you
```swift
simpleKeyboard.add(control: specificTextView, withDoneButtonKeyboard: true)
// Use selector when wanting to process pressing Done button
simpleKeyboard.add(control: lastVisibleTextField, withDoneButtonKeyboard: true, 
                   doneTarget: self, doneSelector: #selector(donePressed(_:)))
```

If you don't want SimpleKeyboard to manage anything, only to correctly handle appearing and disappearing of the keyboard, then simply instantiate without any control
```swift
simpleKeyboard = SimpleKeyboard(fromViewController: self)
```

### Enabling/Disabling
Override viewDidAppear and viewDidDisappear in order to start and stop using SimpleKeyboard
```swift
override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        simpleKeyboard.enable()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        simpleKeyboard.disable()
    }
```

### But wait, I want the keyboard to disappear when I press Return key
You won't need delegates for that. SimpleKeyboard implements this in an elegant way using callbacks for catching different events.
Just set up the callback like this
```swift
override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        simpleKeyboard.enable()
            
        simpleKeyboard.textFieldShouldReturn = { textField in
            textField.resignFirstResponder()
                
            return true
        }
    }
```
Keep in mind this will work only for controls managed by SimpleKeyboard. All others are to be handled inside the View Controller using delegates.

### Inception
What about the case when the View Controller manages different views and a UITableView, which also has different input controls in every cell? There are multiple source files with different outlets, what goes where?

It's easy:
- Create keyboard (with or without specific controls) and enable it
- Implement delegate functions for begining and ending using the keyboard
- Inside these delegates, notify SimpleKeyboard of the current view which receives 
```swift
simpleKeyboard.setActive(view: view)
```
and loses
```swift
simpleKeyboard.clearActiveView()
```
the focus.

For more details, check NoControlsViewController.swift from the example App.

### Things to consider
- **Always** disable the keyboard after enabling it. Failure to do so will most likely result in a crash.
- Do not set the delegate for a control which is being handeled by SimpleKeyboard. Depending on code flow, it could render the benefits of SimpleKeyboard useless. If you need to handle a specific UITextField/UITextView yourself, use the setActive and clearActiveView functions accordingly.

## Installation

### CocoaPods
SimpleKeyboard is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimpleKeyboard'
```
or

```ruby
pod 'SimpleKeyboard', '~> 0.1.1'
```

### Manually
Simply copy SimpleKeyboard.swift to your project and you're ready to go.

## Author

Cristian Sava, cristianzsava@gmail.com

## License

SimpleKeyboard is available under the MIT license. See the LICENSE file for more info.
