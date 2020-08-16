
import UIKit

class OptionsVC: UIViewController {
    
    //MARK: IBOutlets declarations
    @IBOutlet weak var optionsTV: UITextView!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var contactLbl: UILabel!
    @IBOutlet weak var donateLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    
    
    @IBOutlet weak var versionLabel: UILabel!
    
    //MARK: IBActions declarations
    @IBAction func rateAppBtn(sender: AnyObject) {
        rateApp(appId: "id1341425442") { success in
            print("RateApp \(success)")
        }
    }
    
    //MARK: App Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            versionLabel.text = "Ver " + version
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpLanguage()
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    //MARK: Additional functions
    func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    
    func setUpLanguage() {
        optionsTV.text = NSLocalizedString("OptionsText", comment: "OptionsText label")
        languageLbl.text = NSLocalizedString("OptionsLanguageLbl", comment: "OptionsLanguage label")
        contactLbl.text = NSLocalizedString("OptionsContactLbl", comment: "OptionsContact label")
        donateLbl.text = NSLocalizedString("DonateTitle", comment: "OptionsDonate label")
        rateLbl.text = NSLocalizedString("OptionsRateLbl", comment: "OptionsRate label")
    }
}

