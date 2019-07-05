# `AUIApplication`

`AUIApplication` is a proctocol, which provides more _friendly_ inteface for classes [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplication)

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

This method is called, when launch process has begun. Using `launchOptions` it is possible to define reasons the application was launched. `AUIApplication` separate this method on several ones by reasons the application was launched. Only one of them is called: 

##### `willFinishLaunching()`
Method is called when application begins launching because of user taps application icon on the Home screen.

##### `willFinishLaunchingLocation()`
Method is called when application begins launching because of application has subscribed on location changes events and location has changed.

#### Method [`application(_:didFinishLaunchingWithOptions:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application)

```swift
optional func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
```
This method is called, when launch process is almost done. Using `launchOptions` it is possible to define reasons the application was launched. `AUIApplication` separate this method on several ones by reasons the application was launched. Only one of them is called: 

##### `didFinishLaunching()`
Method is called when when application is almost launching because of user taps application icon on the Home screen.

##### `didFinishLaunchingLocation()`
Method is called when when application is almost launching because of application has subscribed on location changes events and location has changed.
