package com.example.adcondo_app

import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.content.Intent
import android.graphics.Color
import android.graphics.Outline
import android.os.Build
import android.os.Bundle
import android.view.Gravity
import android.view.View
import android.view.ViewOutlineProvider
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import com.airbnb.lottie.LottieAnimationView
import com.airbnb.lottie.LottieDrawable

class LottieLaunchActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val animationView = LottieAnimationView(this).apply {
            setAnimation("splash_screen.lottie.json")
            repeatCount = 0
            repeatMode = LottieDrawable.RESTART
            playAnimation()

            layoutParams = FrameLayout.LayoutParams(640, 640, Gravity.CENTER)

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                outlineProvider = object : ViewOutlineProvider() {
                    override fun getOutline(view: View, outline: Outline) {
                        outline.setOval(0, 0, view.width, view.height)
                    }
                }
                clipToOutline = true
            }

            setBackgroundColor(Color.TRANSPARENT)
        }

        val rootLayout = FrameLayout(this)
        rootLayout.layoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        rootLayout.setBackgroundColor(Color.WHITE) // cor de fundo geral da tela
        rootLayout.addView(animationView)

        setContentView(rootLayout)

        animationView.addAnimatorListener(object : AnimatorListenerAdapter() {
            override fun onAnimationEnd(animation: Animator) {
                startActivity(Intent(this@LottieLaunchActivity, MainActivity::class.java))
                finish()
            }
        })
    }
}