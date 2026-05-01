;;; Note: Colors are 0xAARRGGBB

;;; Import symbols

(local gallery swayimg.gallery)
(local imagelist swayimg.imagelist)
(local slideshow swayimg.slideshow)
(local text swayimg.text)
(local viewer swayimg.viewer)

;;; General settings

(swayimg.on_window_resize #((. (. swayimg (swayimg.get_mode)) :reset)))
(text.hide)

;;; Functions

(fn make-order-handler []
  "Image sort order closure."
  (var order :none)
  (var orders [:alpha :mtime :random])
  (var orders-idx (collect [k v (pairs orders)] (values v k)))

  (fn set-order [new-order]
    (when (not (. orders-idx new-order))
      (error "Invalid order."))
    (set order new-order)
    (imagelist.set_order order)
    (if (= order :mtime)
        (imagelist.enable_reverse true)
        (imagelist.enable_reverse false))
    (text.set_status (.. "Sort: " order)))

  (fn next-order []
    (set-order (. orders (+ 1 (% (. orders-idx order) (length orders))))))

  {:order #order : set-order : next-order})

(local order (make-order-handler))
(order.set-order :alpha)
;;; I want to be able to set the order on the command line via --execute, and
;;; exporting order globally seems to be the only way to do this.
(set _G.order order)

(fn make-antialiasing-handler []
  "Antialiasing toggle closure."
  (var enabled? true)

  (fn set-enabled [status]
    (set enabled? status)
    (swayimg.enable_antialiasing enabled?)
    (text.set_status (.. "Antialiasing: " (tostring enabled?))))

  {:enabled? #enabled?
   :enable #(set-enabled true)
   :disable #(set-enabled false)
   :toggle #(set-enabled (not enabled?))})

(local antialiasing (make-antialiasing-handler))
(antialiasing.enable)

(fn make-timeout-handler []
  "Slideshow timeout closure."
  (var timeout 1)

  (fn set-timeout [time]
    "Set slideshow timeout."
    (set timeout (if (> time 1) time 1))
    (slideshow.set_timeout time)
    (text.set_status (.. "Timeout: " timeout)))

  {: set-timeout :current-timeout #timeout})

(local timeout (make-timeout-handler))

(fn trash-image [image]
  (if (= 0 (os.execute (.. "trash -- " image.path)))
      (text.set_status (.. "Trashed '" image.path "'"))
      (text.set_status (.. "Could not trash '" image.path "'"))))

;;; Common settings for both viewer and slideshow (inherits from viewer) mode.

(fn viewer-mode-setup [mode]
  ;; Settings
  (mode.on_image_change mode.animation_resume)
  (mode.set_default_scale :fit)
  (mode.set_image_background 0xff000000)
  (mode.set_window_background 0xff000000)
  ;; Bindings
  (mode.bind_reset)
  (local bindings {:Down #(let [scale (mode.get_scale)]
                            (mode.set_abs_scale (- scale (* 0.1 scale))))
                   :End #(mode.switch_image :last)
                   :Escape swayimg.exit
                   :Home #(mode.switch_image :first)
                   :Left #(mode.switch_image :prev)
                   :Right #(mode.switch_image :next)
                   :Shift+Delete #(trash-image (mode.get_image))
                   :Shift+x #(mode.set_fix_scale :fill)
                   :Shift+z #(mode.set_fix_scale :fit)
                   :Up #(let [scale (mode.get_scale)]
                          (mode.set_abs_scale (+ scale (* 0.1 scale))))
                   :a antialiasing.toggle
                   :f swayimg.toggle_fullscreen
                   :i #(if (text.visible) (text.hide) (text.show))
                   :s order.next-order
                   :z #(mode.switch_image :random)})
  (each [key event (pairs bindings)]
    (mode.on_key key event)))

;;; Viewer settings

(viewer-mode-setup viewer)
(let [extra-bindings {:Shift+s #(swayimg.set_mode :slideshow)}]
  (each [key event (pairs extra-bindings)]
    (viewer.on_key key event)))

;;; Slideshow settings

(viewer-mode-setup slideshow)
(slideshow.set_window_background :extend)
(timeout.set-timeout 5)
(let [extra-bindings {:Shift+Left #(timeout.set-timeout (- (timeout.current-timeout)
                                                           1))
                      :Shift+Right #(timeout.set-timeout (+ 1
                                                            (timeout.current-timeout)))
                      :Shift+s #(swayimg.set_mode :viewer)}]
  (each [key event (pairs extra-bindings)]
    (slideshow.on_key key event)))

;;; Suppress status messages emitted during startup.
(text.set_status "")
