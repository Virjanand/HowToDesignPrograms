;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter4_5b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A LRCD (short for: launching rocket count down) is one of:
; – "resting"
; – a number in [-3,-1]
; – a non-negative number 
; interpretation a rocket resting on the ground, in count-down mode, 
; or the number of pixels from the top i.e. its height

; constants
(define WIDTH 100)
(define HEIGHT 300)
(define YDELTA 3)
(define XLOCATION 10)

; graphical constants
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
(define ROCKET-CENTER (/ (image-height ROCKET) 2))

; WorldState -> Image
; draws the rocket at height y on the background
(define (draw-rocket y)
  (place-image ROCKET XLOCATION (- y ROCKET-CENTER) BACKG))

; LRCD -> Image
; renders the state as a resting or flying rocket
(check-expect
 (show "resting")
 (place-image ROCKET
              XLOCATION (- HEIGHT (/ (image-height ROCKET) 2))
              BACKG))
 
(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              XLOCATION (* 3/4 WIDTH)
              (place-image ROCKET
                           XLOCATION (- HEIGHT (/ (image-height ROCKET) 2))
                           BACKG)))
 
(check-expect
 (show HEIGHT)
 (place-image ROCKET XLOCATION (- HEIGHT ROCKET-CENTER) BACKG))
 
(check-expect
 (show 53)
 (place-image ROCKET XLOCATION (- 53 ROCKET-CENTER) BACKG))

(define (show x)
  (cond
    [(string? x)
     (draw-rocket HEIGHT)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  XLOCATION (* 3/4 WIDTH)
                  (draw-rocket HEIGHT))]
    [(>= x 0)
     (draw-rocket x)]))
 
; LRCD KeyEvent -> LRCD
; starts the count-down when space bar is pressed, 
; if the rocket is still resting
(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "a") "resting")
(check-expect (launch -3 " ") -3)
(check-expect (launch -1 " ")  -1)
(check-expect (launch 33 " ") 33)
(check-expect (launch 33 "a") 33)
(define (launch x ke)
  (cond
    [(string? x) (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))
 
; LRCD -> LRCD
; raises the rocket by YDELTA,
;  if it is moving already
(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(check-expect (fly -1) HEIGHT)
(check-expect (fly 10) (- 10 YDELTA))
(check-expect (fly 22) (- 22 YDELTA))
(define (fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
    [(>= x 0) (- x YDELTA)]))

; LRCD -> bool
; stops program when ws goes to 0 which means the rocket has left the background
(check-expect (end? "resting") false)
(check-expect (end? -3) false)
(check-expect (end? 10) false)
(check-expect (end? 0) true)
(define (end? ws)
  (cond
    [(string? ws) false]
    [else (= ws 0)]))
    

; LRCD -> LRCD
(define (main1 s)
  (big-bang s
            [to-draw show]
            [on-key launch]))

; LRCD -> LRCD
(define (main2 s)
  (big-bang s
            [to-draw show]
            [on-key launch]
            [on-tick fly .3]
            [stop-when end?]))