package com.oblador.storereview

import android.os.Build.VERSION.SDK_INT
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.google.android.play.core.review.ReviewManagerFactory

class StoreReviewModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "RNStoreReview"
    }

    override fun getConstants(): MutableMap<String, Any> {
        return mutableMapOf<String, Any>("isAvailable" to (SDK_INT >= 21))
    }

    @ReactMethod
    fun requestReview() {
        val manager = ReviewManagerFactory.create(reactApplicationContext)

        val requestReview = manager.requestReviewFlow()
        requestReview.addOnCompleteListener { request ->
            if (request.isSuccessful) {
                // We got the ReviewInfo object
                val reviewInfo = request.result
                val activity = currentActivity

                if (activity != null) {
                    val flow = manager.launchReviewFlow(activity, reviewInfo)
                    flow.addOnCompleteListener { _ ->
                        // The flow has finished. The API does not indicate whether the user
                        // reviewed or not, or even whether the review dialog was shown. Thus, no
                        // matter the result, we continue our app flow.
                    }


                }
            }
        }
    }

    
}
