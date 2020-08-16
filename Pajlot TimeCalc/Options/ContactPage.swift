
import UIKit
import MessageUI


class ContactPage: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var mailBtn: UIButton!
    @IBOutlet weak var instagramBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    
    @IBOutlet weak var ContactInfo1: UITextView!
    
    @IBOutlet weak var ContactInfo2: UITextView!
    
    @IBAction func sendEmail(sender: AnyObject) {
        sendEmail()
    }
    
    let twitterUrl = URL(string: "http://twitter.com/pajlotapps")
    let instagramUrl = URL(string: "http://www.instagram.com/pajlotapps/")
    let facebookUrl = URL(string: "https://www.facebook.com/pajlot.apps")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("ContactTitle", comment: "Title")
        ContactInfo1.text = NSLocalizedString("ContactInfo1", comment: "Info1")
        ContactInfo2.text = NSLocalizedString("ContactInfo2", comment: "Info2")
        
        let twitterLogo = UIImage(named: "twitter")
        let twitterTint = twitterLogo?.maskWith(color: activeColor)
        
        let instagramLogo = UIImage(named: "instagram")
        let instagramTint = instagramLogo?.maskWith(color: activeColor)
        
        let facebookLogo = UIImage(named: "facebook")
        let facebookTint = facebookLogo?.maskWith(color: activeColor)
        
        let mailLogo = UIImage(named: "mail")
        let mailTint = mailLogo?.maskWith(color: activeColor)
        
        twitterBtn.setImage(twitterTint, for: UIControlState.normal)
        instagramBtn.setImage(instagramTint, for: UIControlState.normal)
        facebookBtn.setImage(facebookTint, for: UIControlState.normal)
        mailBtn.setImage(mailTint, for: UIControlState.normal)
        
        twitterBtn.addTarget(self, action: #selector(didTapTwitter), for: .touchUpInside)
        instagramBtn.addTarget(self, action: #selector(didTapInstagram), for: .touchUpInside)
        facebookBtn.addTarget(self, action: #selector(didTapFacebook), for: .touchUpInside)
        
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["pajlotapps@gmail.com"])
            mail.setMessageBody("<p>...</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    @objc func didTapTwitter(sender: AnyObject) {
        UIApplication.shared.open(twitterUrl!, options: [:], completionHandler: nil)
    }
    @objc func didTapInstagram(sender: AnyObject) {
        UIApplication.shared.open(instagramUrl!, options: [:], completionHandler: nil)
    }
    @objc func didTapFacebook(sender: AnyObject) {
        UIApplication.shared.open(facebookUrl!, options: [:], completionHandler: nil)
    }
    
}

