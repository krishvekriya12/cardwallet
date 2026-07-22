package com.example.cardwallet

import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.NativeAdFactory

class NativeAdFactoryImpl(private val layoutInflater: LayoutInflater) : NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: Map<String, Any>?
    ): NativeAdView {
        val adView = layoutInflater.inflate(R.layout.native_ad_layout, null) as NativeAdView

        // 1. Headline
        val headlineView = adView.findViewById<TextView>(R.id.ad_headline)
        headlineView.text = nativeAd.headline
        adView.headlineView = headlineView

        // 2. Body
        val bodyView = adView.findViewById<TextView>(R.id.ad_body)
        if (nativeAd.body == null) {
            bodyView.visibility = View.INVISIBLE
        } else {
            bodyView.visibility = View.VISIBLE
            bodyView.text = nativeAd.body
        }
        adView.bodyView = bodyView

        // 3. Call to Action
        val callToActionView = adView.findViewById<Button>(R.id.ad_call_to_action)
        if (nativeAd.callToAction == null) {
            callToActionView.visibility = View.INVISIBLE
        } else {
            callToActionView.visibility = View.VISIBLE
            callToActionView.text = nativeAd.callToAction
        }
        adView.callToActionView = callToActionView

        // 4. App Icon
        val iconView = adView.findViewById<ImageView>(R.id.ad_app_icon)
        if (nativeAd.icon == null) {
            iconView.visibility = View.GONE
        } else {
            iconView.setImageDrawable(nativeAd.icon?.drawable)
            iconView.visibility = View.VISIBLE
        }
        adView.iconView = iconView

        // 5. Media (Image/Video)
        val mediaView = adView.findViewById<MediaView>(R.id.ad_media)
        if (mediaView != null) {
            adView.mediaView = mediaView
        }

        // 6. Star Rating (Blue Stars ★ ★ ★ ★ ☆ matching reference image)
        val starsTextView = adView.findViewById<TextView>(R.id.ad_stars_text)
        if (nativeAd.starRating == null || nativeAd.starRating == 0.0) {
            starsTextView.visibility = View.GONE
        } else {
            val rating = nativeAd.starRating!!.toDouble()
            val filledStars = rating.toInt().coerceIn(0, 5)
            val emptyStars = 5 - filledStars
            val starString = "★".repeat(filledStars) + "☆".repeat(emptyStars)
            starsTextView.text = starString
            starsTextView.visibility = View.VISIBLE
        }
        adView.starRatingView = starsTextView

        adView.setNativeAd(nativeAd)
        return adView
    }
}
