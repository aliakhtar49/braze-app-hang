
import BrazeKit
import AdSupport
import BrazeUI
import AppTrackingTransparency


struct BrazeClient {

    private static var braze: Braze?

    static var shared: Braze? {
        braze
    }


    @MainActor static func start() {
        let configuration = Braze.Configuration(
            apiKey: "eeeee",
            endpoint: "sdk.iad-01.braze.com"
        )
        configuration.push.automation = true
        configuration.push.automation.requestAuthorizationAtLaunch = false
        braze = Braze(configuration: configuration)
//        braze?.set(
//            identifierForAdvertiser:  ATTrackingManager.trackingAuthorizationStatus == .authorized
//            ? ASIdentifierManager.shared().advertisingIdentifier.uuidString
//            : nil
//        )
        braze?.set(adTrackingEnabled: true)

        let inAppMessageUI = BrazeInAppMessageUI()
        // inAppMessageUI.delegate = inAppMessageDelegate
        braze?.inAppMessagePresenter = inAppMessageUI
    }

    static func add(userAlias: AppboyUserAlias) {
        shared?.user.addAlias(userAlias.name, withLabel: userAlias.label)
    }

    static func toggleNotification(isOn: Bool) {
        let state: Braze.User.SubscriptionState = isOn ? .optedIn : .unsubscribed
        shared?.user.set(pushNotificationSubscriptionState: state)

    }

}

enum AppboyUserAlias {
    case perseusClientId(value: String)
    
    var label: String {
        switch self {
        case .perseusClientId:
            return "perseus_client_id"
        }
    }
    
    var name: String {
        switch self {
        case .perseusClientId(let value):
            return value
        }
    }
}

