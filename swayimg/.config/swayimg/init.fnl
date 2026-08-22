;;; Note: Colors are 0xAARRGGBB

;;; Import symbols

(local gallery swayimg.gallery)
(local imagelist swayimg.imagelist)
(local slideshow swayimg.slideshow)
(local text swayimg.text)
(local viewer swayimg.viewer)

;;; General settings

(swayimg.on_window_resize #((. (. swayimg swayimg.mode) :reset)))
(set imagelist.order :alpha)
(set swayimg.antialiasing true)
(set text.visible false)

;;; Functions

(fn noop []
  "Do nothing.")

(fn make-order-handler []
  "Image sort order closure."
  (var orders [:alpha :mtime :random])
  (var orders-idx (collect [k v (pairs orders)] (values v k)))

  (fn set-order [new-order]
    (when (not (. orders-idx new-order))
      (error "Invalid order."))
    (set imagelist.order new-order)
    (if (= imagelist.order :mtime)
        (set imagelist.reverse true)
        (set imagelist.reverse false))
    (set text.status (.. "Sort: " imagelist.order)))

  (fn next-order []
    (set-order (. orders
                  (+ 1 (% (. orders-idx imagelist.order) (length orders))))))

  {: set-order : next-order})

(local order (make-order-handler))

(fn set-timeout [time]
  "Set slideshow timeout. Clamp values <1 to 1. Print a status message."
  (set slideshow.timeout (if (> time 1) time 1))
  (set text.status (.. "Timeout: " slideshow.timeout)))

(fn escape-quote [path]
  "Escape a single quote in a single-quoted string according to Bash rules. This
requires terminating the string, inserting a literal single quote, then starting
a new string."
  (string.gsub path "'" "'\\''"))

(fn trash-image [image]
  "Move an image to the system trash via trash-cli."
  (if (= 0 (os.execute (.. "trash -- '" (escape-quote image.path) "'")))
      (set text.status (.. "Trashed '" image.path "'"))
      (set text.status (.. "Could not trash '" image.path "'"))))

(fn zoom [scalar]
  "Zoom by scalar relative to the current scale. >1 zooms in, <1 zooms out."
  (let [mode (. swayimg swayimg.mode)]
    (mode.set_abs_scale (* mode.scale scalar))))

;;; Common settings for both viewer and slideshow (inherits from viewer) mode.

(fn viewer-mode-setup [mode]
  ;; Settings
  (mode.on_image_change #(set mode.animation true))
  (set mode.default_scale :fit)
  (mode.set_image_background 0xff000000)
  (mode.set_window_background 0xff000000)
  ;; Bindings
  (mode.bind_reset)
  (let [zoom-in-scalar 1.1
        zoom-out-scalar (/ 1 zoom-in-scalar)
        key-bindings {:Down #(zoom zoom-out-scalar)
                      :End #(mode.open :last)
                      :Escape swayimg.exit
                      :Home #(mode.open :first)
                      :Left #(mode.open :prev)
                      :Right #(mode.open :next)
                      :Shift+Delete #(trash-image (mode.get_image))
                      :Shift+Down #(zoom 0.5)
                      :Shift+Up #(zoom 2.0)
                      :Shift+c #(mode.set_fix_scale :real)
                      :Shift+x #(mode.set_fix_scale :fill)
                      :Shift+z #(mode.set_fix_scale :fit)
                      :Up #(zoom zoom-in-scalar)
                      :a #(set swayimg.antialiasing (not swayimg.antialiasing))
                      :f #(set swayimg.fullscreen (not swayimg.fullscreen))
                      :i #(set text.visible (not text.visible))
                      :s order.next-order
                      :z #(mode.open :random)}
        mouse-bindings {:MouseLeft noop
                        :ScrollDown #(zoom zoom-out-scalar)
                        :ScrollUp #(zoom zoom-in-scalar)}]
    (each [event func (pairs key-bindings)]
      (mode.on_key event func))
    (each [event func (pairs mouse-bindings)]
      (mode.on_mouse event func))))

;;; Viewer settings

(viewer-mode-setup viewer)
(let [extra-bindings {:Shift+s #(set swayimg.mode :slideshow)}]
  (each [key event (pairs extra-bindings)]
    (viewer.on_key key event)))

;;; Slideshow settings

(viewer-mode-setup slideshow)
(slideshow.set_window_background :extend)
(set slideshow.timeout 5)
(let [extra-bindings {:Shift+Left #(set-timeout (- slideshow.timeout 1))
                      :Shift+Right #(set-timeout (+ slideshow.timeout 1))
                      :Shift+s #(set swayimg.mode :viewer)}]
  (each [key event (pairs extra-bindings)]
    (slideshow.on_key key event)))

;;; Suppress status messages emitted during startup.
(set text.status "")
