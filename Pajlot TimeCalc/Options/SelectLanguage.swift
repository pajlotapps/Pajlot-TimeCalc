
import UIKit

class SelectLanguage: UIViewController {
    
    @IBOutlet weak var polishCheckMarkBtn: UIButton!
    @IBOutlet weak var englishCheckMarkBtn: UIButton!
    
    @IBOutlet weak var polishLbl: UILabel!
    @IBOutlet weak var englishLbl: UILabel!
    
    @IBOutlet weak var info1: UITextView!
    @IBOutlet weak var info2: UITextView!
    
    
    var language: String!
    
    let checkMark = UIImage(named: "ic_done")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("ChangeLanguageTitle", comment: "Title")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setActiveLanguage()
        setUpLanguage()
    }
    
    @IBAction func changeLanguage(_ sender: UIButton) {
        let activeTintCheck = checkMark?.maskWith(color: activeColor)
        let clearTintCheck = checkMark?.maskWith(color: UIColor.clear)
        
        let selectedLanguage:Languages = sender.tag == 1 ? .pl : .en
        LanguageManger.shared.setLanguage(language: selectedLanguage)
        
        
        if sender.tag == 1 {
            prefs.set("pl", forKey: Keys.lang)
            polishCheckMarkBtn.setImage(activeTintCheck, for: UIControlState.normal)
            englishCheckMarkBtn.setImage(clearTintCheck, for: UIControlState.normal)
        }else{
            prefs.set("en", forKey: Keys.lang)
            polishCheckMarkBtn.setImage(clearTintCheck, for: UIControlState.normal)
            englishCheckMarkBtn.setImage(activeTintCheck, for: UIControlState.normal)
        }
    }
    
    func setActiveLanguage(){
        var language = Locale.current.languageCode
        
        let activeTintCheck = checkMark?.maskWith(color: activeColor)
        let clearTintCheck = checkMark?.maskWith(color: UIColor.clear)
        
        if let retrived = prefs.object(forKey: Keys.lang) as? String {
            language = retrived
        }
        switch language {
        case "pl"?:
            polishCheckMarkBtn.setImage(activeTintCheck, for: UIControlState.normal)
            englishCheckMarkBtn.setImage(clearTintCheck, for: UIControlState.normal)
        case "en"?:
            polishCheckMarkBtn.setImage(clearTintCheck, for: UIControlState.normal)
            englishCheckMarkBtn.setImage(activeTintCheck, for: UIControlState.normal)
        default:
            polishCheckMarkBtn.setImage(clearTintCheck, for: UIControlState.normal)
            englishCheckMarkBtn.setImage(activeTintCheck, for: UIControlState.normal)
        }
    }
    
    func setUpLanguage() {
        polishLbl.text = NSLocalizedString("PolishLangLbl", comment: "Polish Language label")
        englishLbl.text = NSLocalizedString("EnglishLangLbl", comment: "English Language label")
        info1.text = NSLocalizedString("SLinfo1", comment: "Info 1")
        info2.text = NSLocalizedString("SLinfo2", comment: "Info 2")
    }
}



