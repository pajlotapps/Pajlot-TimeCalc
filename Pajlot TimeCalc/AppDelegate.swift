
import UIKit
import Firebase
import StoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()

        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barStyle  = .blackTranslucent
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = mainColor
        UINavigationBar.appearance().clipsToBounds = true
        
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().clipsToBounds = true
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = mainColor
        
        
        UITabBar.appearance().barTintColor = mainColor
        UITabBar.appearance().tintColor = activeColor
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        
        

        let shortestTime: UInt32 = 50
        let longestTime: UInt32 = 500
        guard let rateTimeInterval = TimeInterval(exactly: arc4random_uniform(longestTime - shortestTime) + shortestTime) else { return true }
        
        let upgradeShortestTime: UInt32 = 65
        let upgradeLongestTime: UInt32 = 1000
        guard let upgradeTimeInterval = TimeInterval(exactly: arc4random_uniform(upgradeLongestTime - upgradeShortestTime) + upgradeShortestTime) else { return true }

        
        Timer.scheduledTimer(timeInterval: rateTimeInterval, target: self, selector: #selector(AppDelegate.requestReview), userInfo: nil, repeats: false)
        
        Timer.scheduledTimer(timeInterval: upgradeTimeInterval, target: self, selector: #selector(AppDelegate.jumpToUpgradeVC), userInfo: nil, repeats: false)
        
        return true
    }

    @objc func requestReview() {
        SKStoreReviewController.requestReview()
    }
    
    @objc func jumpToUpgradeVC() {
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "upgradeVC")
        controller.modalTransitionStyle = .crossDissolve
        UIApplication.topViewController?.present(controller, animated: true, completion: nil)
    }

}
