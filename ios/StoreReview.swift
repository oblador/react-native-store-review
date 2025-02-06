import Foundation
import StoreKit

@objc
public class StoreReview: NSObject {

  @MainActor
  @objc
  public static func requestReview() {
    if let activeScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
      if #available(iOS 16.0, *) {
        AppStore.requestReview(in: activeScene)
      } else {
        SKStoreReviewController.requestReview(in: activeScene)
      }
    }
  }
}
