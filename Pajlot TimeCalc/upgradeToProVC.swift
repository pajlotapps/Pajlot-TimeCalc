import UIKit

class upgradeToProVC: UIViewController {
    
    @IBOutlet weak var soonInAppStore: UITextView!
    @IBOutlet weak var featuresTextField: UITextView!
    @IBOutlet weak var goToAppStoreBtn: RoundedCalcBtn!
    @IBOutlet weak var notInterestedBtn: RoundedCalcBtn!
    
    //MARK: App Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
    }
    override open var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func goToAppStore(_ sender: Any) {
        visitAppStore(appId: "id1342113626") { success in
            print("Jump to AppStore \(success)")
        }
    }
    
    func visitAppStore(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "https://itunes.apple.com/pl/app/pajlot-timecalc-pro/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    
    @IBAction func dissmissUpgradeToPro(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLanguage()
    }
    
    //MARK: Additional functions
    func setUpLanguage() {
        soonInAppStore.text = NSLocalizedString("soonInAppStoreText", comment: "soonInAppStore text")
        featuresTextField.text = NSLocalizedString("featuresTextFieldText", comment: "featuresTextField text")
        goToAppStoreBtn.setTitle((NSLocalizedString("goToAppStoreBtn", comment: "goToAppStoreBtn content")), for: UIControlState.normal)
        notInterestedBtn.setTitle((NSLocalizedString("notInterestedBtn", comment: "notInterestedBtn content")), for: UIControlState.normal)
    }
}

