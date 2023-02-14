import Foundation
import Capacitor
import Contacts
import Em


/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ContactPluginPlugin)
public class ContactPluginPlugin: CAPPlugin {
    private let implementation = ContactPlugin()
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func getUUID(_ call: CAPPluginCall) {
        
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": UIDevice.current.identifierForVendor!.uuidString
        ])
    }
    
    @objc func getContacts(_ call: CAPPluginCall) {
        let value = call.getString("filter") ?? ""
        let contactStore = CNContactStore()
        
        var contacts = [Any]()
        let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
        ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        
        contactStore.requestAccess(for: .contacts) { (granted, error) in
            if let error = error{
                print("failed to request access", error)
                call.reject("access denied")
                return
            }
            
            if granted{
                do {
                    try contactStore.enumerateContacts(with: request) {
                        (contact, stop) in
                        contacts.append([
                            "firstName":contact.givenName,
                            "lastName":contact.familyName,
                            "telephone": contact.phoneNumbers.first?.value.stringValue ?? "",
                        ])
                    }
                    print(contacts)
                    call.success([
                        "results": contacts
                    ])
                }catch{
                    print("unable to fetch contacts")
                    call.reject("Unable to fetch contacts")
                }
            }
        }
    }
}
