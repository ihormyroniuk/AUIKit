# [`AUIApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIApplication.swift)

[`AUIApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIApplication.swift) is a proctocol, which provides more _friendly_ inteface for class [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplication) and its delegate [`UIApplicationDelegate`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate)

```swift
public protocol AUIApplication: UIApplicationDelegate where Self: UIApplication {
  
  // MARK: Launching
  
  func willFinishLaunching()
  func willFinishLaunchingNotification(payload: [AnyHashable: Any])
  func willFinishLaunchingLocation()
  func willFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)
  func didFinishLaunching()
  func didFinishLaunchingNotification(payload: [AnyHashable: Any])
  func didFinishLaunchingLocation()
  func didFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)
  
  // MARK: States
  
  func willEnterForeground()
  func didBecomeActive()
  func willResignActive()
  func didEnterBackground()
  func willTerminate()
  
  // MARK: Memory
  
  func didReceiveMemoryWarning()
  
}
```

### Inheritance & Restriction

Protocol inherits [`UIApplicationDelegate`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate) and can be implemented only by [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplication) and its subclasses. 

### Methods

##### `willFinishLaunching()`
Method is called when application begins launching in response to the user tapping a Home screen icon.

##### `willFinishLaunchingNotification(payload: [AnyHashable: Any])`
Method is called when application begins launching in response to the user selecting notification alert.

##### `willFinishLaunchingLocation()`
Method is called when application begins launching because of application has subscribed on location changes events and location has changed.

##### `willFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)`
Method is called when application begins launching in response to the user selecting a Home screen quick action.

##### `didFinishLaunching()`
Method is called when application is almost launching in response to the user tapping a Home screen icon.

##### `didFinishLaunchingNotification(payload: [AnyHashable: Any])`
Method is called when application is almost launching in response to the user selecting notification alert.

##### `didFinishLaunchingLocation()`
Method is called when when application is almost launching because of application has subscribed on location changes events and location has changed.

##### `didFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem)`
Method is called when application is almost launching in response to the user selecting a Home screen quick action.

##### `willEnterForeground()`
Method is called when application is about to enter the foreground.

##### `didBecomeActive()`
Method is called when application has become active.

##### `willResignActive()`
Method is called when application is about to become inactive.

##### `didEnterBackground()`
Method is called when application is now in the background.

##### `willTerminate()`
Method is called when application is about to terminate.

##### `didReceiveMemoryWarning()`
Method is called when application receives a memory warning.

### Difference

#### Method [`application(_:willFinishLaunchingWithOptions:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623032-application)

```swift
optional func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
```

This method is called, when launch process has begun. Using `launchOptions` it is possible to define reasons the application was launched. [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplication) separate this method on several ones by reasons the application was launched. Only one of them is called:

#### Method [`application(_:didFinishLaunchingWithOptions:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application)

```swift
optional func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
```

This method is called, when launch process is almost done. Using `launchOptions` it is possible to define reasons the application was launched. [`AUIApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIApplication.swift) separate this method on several ones by reasons the application was launched:
[`willFinishLaunching()`](https://github.com/ihormyroniuk/AUIKit/tree/master/AUIKit/Application#willfinishlaunching)
[`willFinishLaunchingNotification(payload: [AnyHashable: Any])`](https://github.com/ihormyroniuk/AUIKit/tree/master/AUIKit/Application#willfinishlaunchingnotificationpayload-anyhashable-any)

### Implementation

There is a default implementation of [`AUIApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIApplication.swift), it is class [`AUIDefaultApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIDefaultApplication.swift).
