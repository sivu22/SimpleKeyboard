# SimpleKeyboard

![Swift](https://img.shields.io/badge/Swift-3.0-brightgreen.svg)
[![Version](https://img.shields.io/cocoapods/v/SimpleKeyboard.svg?style=flat)](http://cocoapods.org/pods/SimpleKeyboard)
[![License](https://img.shields.io/cocoapods/l/SimpleKeyboard.svg?style=flat)](http://cocoapods.org/pods/SimpleKeyboard)
[![Platform](https://img.shields.io/cocoapods/p/SimpleKeyboard.svg?style=flat)](http://cocoapods.org/pods/SimpleKeyboard)

SimpleKeyboard addresses a very common problem on the iOS platform: when the keyboard is shown, it can happen that the input field under it is not visible anymore. Since there is no simple or out-of-the-box general solution for this, SimpleKeyboard attempts to provide exactly that.

What makes SimpleKeyboard simple is the fact it works in every View Controller without requiring UIScrollView, AutoLayout, bottom-constraint or any other stuff that is present in different solutions.

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


## Installation

### CocoaPods
SimpleKeyboard is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimpleKeyboard'
```
or

```ruby
pod 'SimpleKeyboard', '~> 0.1.0'
```

### Manually
Simply copy SimpleKeyboard.swift to your project and you're ready to go.

## Author

Cristian Sava, cristianzsava@gmail.com

## License

SimpleKeyboard is available under the MIT license. See the LICENSE file for more info.
