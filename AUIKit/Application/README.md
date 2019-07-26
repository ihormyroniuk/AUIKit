# [`AUIApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIApplication.swift)

[`AUIApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIApplication.swift) is a proctocol, which provides more _friendly_ inteface for classes [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplication)

### Inheritance & Restriction

Protocol inherits [`UIApplicationDelegate`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate) and can be implemented only by [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplication) and its subclasses. 

```swift
public protocol AUIApplication: UIApplicationDelegate where Self: UIApplication {
  ...
}
```

This assumes that implementation inherits [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplication) and implements [`UIApplicationDelegate`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate).

#### Method [`application(_:willFinishLaunchingWithOptions:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623032-application)

```swift
optional func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
```

This method is called, when launch process has begun. Using `launchOptions` it is possible to define reasons the application was launched. [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplication) separate this method on several ones by reasons the application was launched. Only one of them is called: 

##### `willFinishLaunchingLocation()`
Method is called when application begins launching because of application has subscribed on location changes events and location has changed.

##### `willFinishLaunchingNotification(payload: [AnyHashable: Any])`
Method is called when application begins launching because of user taps notification's alert.

##### `willFinishLaunching()`
Method is called when application begins launching because of user taps application icon on the Home screen.

#### Method [`application(_:didFinishLaunchingWithOptions:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application)

```swift
optional func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
```

This method is called, when launch process is almost done. Using `launchOptions` it is possible to define reasons the application was launched. [`AUIApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIApplication.swift) separate this method on several ones by reasons the application was launched. Only one of them is called: 

##### `didFinishLaunchingLocation()`
Method is called when when application is almost launching because of application has subscribed on location changes events and location has changed.

##### `didFinishLaunchingNotification(payload: [AnyHashable: Any])`
Method is called when application is almost launching because of user taps notification's alert.

##### `didFinishLaunching()`
Method is called when when application is almost launching because of user taps application icon on the Home screen.

---

There is a default implementation of [`AUIApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIApplication.swift), it is class [`AUIDefaultApplication`](https://github.com/ihormyroniuk/AUIKit/blob/master/AUIKit/Application/AUIDefaultApplication.swift).
