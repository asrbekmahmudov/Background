
import Foundation

extension Bundle {
    private static var bundle: Bundle!
    
    public static func localizedBundle() -> Bundle! {
        if bundle == nil {
            let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "en"
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
            bundle = Bundle(path: path!)
        }
        
        return bundle;
    }
    
    public static func setLanguage(_ language: String) {
        UserDefaults.standard.set(language, forKey: "app_lang")
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        bundle = Bundle(path: path!)
    }
}

extension String {
    func localized() -> String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.localizedBundle(), value: "", comment: "")
    }
    
    func localizeWithFormat(arguments: CVarArg...) -> String {
        return String(format: self.localized(), arguments: arguments)
    }
}
