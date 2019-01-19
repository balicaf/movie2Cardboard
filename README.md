# movie2Cardboard
Goal: 
  Create UHD SBS video with lens correction to watch movies on xperia xz premium with google cardboards.

Motivation:
  Xperia xz premium has a 4K display (UHD) but run natively in full HD.
  You need to have compatible apps to (e.g. VLC, youtube, etc...) to watch 4K content. 
  
  Or connect your phone to a computer then:
  "adb shell"
  "wm size 2160x3840"
  "wm density 807"
  Then use app like VaR's VR Player PRO
  https://play.google.com/store/apps/details?id=com.VaRs.VRPlayerPRO

How does it work?

  -Curve the video with your k1 k2 cardboard lens coefficient.
  
  -Create two 1080p streams from slightly cropped input (pixel shifting should give different information to each eyes).
  
  -Stack it and overlay a black/transparent mask to hide green pixels.
 
what's missing: 
  -No chromatic aberration correction.

 
