import UIKit

open class AUIEmptyApplication: UIApplication, AUIApplication {
  
    // MARK: - Launching
  
    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
            willFinishLaunchingLocation()
            return true
        } else if let payload = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? [AnyHashable: Any] {
            willFinishLaunchingNotification(payload: payload)
            return true
        } else if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            willFinishLaunchingShortcutItem(shortcutItem)
            return true
        } else {
            willFinishLaunching()
            return true
        }
    }
  
    open func willFinishLaunching() {
        
    }
  
    open func willFinishLaunchingNotification(payload: [AnyHashable : Any]) {
        
    }
  
    open func willFinishLaunchingLocation() {
        
    }
  
    open func willFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem) {
        
    }

    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
            didFinishLaunchingLocation()
            return true
        } else if let payload = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? [AnyHashable: Any] {
            didFinishLaunchingNotification(payload: payload)
            return true
        } else if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            didFinishLaunchingShortcutItem(shortcutItem)
            return true
        } else {
            didFinishLaunching()
            return true
        }
    }
  
    open func didFinishLaunching() {
        
    }
  
    open func didFinishLaunchingNotification(payload: [AnyHashable : Any]) {
        
    }
  
    open func didFinishLaunchingLocation() {
        
    }
  
    open func didFinishLaunchingShortcutItem(_ shortcutItem: UIApplicationShortcutItem) {
        
    }

    // MARK: - State
  
    open func applicationWillEnterForeground(_ application: UIApplication) {
        willEnterForeground()
    }
  
    open func willEnterForeground() {
    
    }
  
    open func applicationDidBecomeActive(_ application: UIApplication) {
        didBecomeActive()
    }
  
    open func didBecomeActive() {
        
    }
  
    open func applicationWillResignActive(_ application: UIApplication) {
        willResignActive()
    }
  
    open func willResignActive() {
        
    }
  
    open func applicationDidEnterBackground(_ application: UIApplication) {
        didEnterBackground()
    }
  
    open func didEnterBackground() {
        
    }
  
    open func applicationWillTerminate(_ application: UIApplication) {
        willTerminate()
    }
  
    open func willTerminate() {
        
    }
  
    // MARK: - Memory
  
    open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        didReceiveMemoryWarning()
    }
  
    open func didReceiveMemoryWarning() {
    
    }
    
    // MARK: - Time
    
    open func applicationSignificantTimeChange(_ application: UIApplication) {
        significantTimeChange()
    }
    
    open func significantTimeChange() {
        
    }
    
    // MARK: - URL
    
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return open(url: url, options: options)
    }
    
    open func open(url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return false
    }
    
    // MARK: - Window
    
    open var window: UIWindow?
    
}
