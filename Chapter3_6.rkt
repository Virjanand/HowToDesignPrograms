;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter3_6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Move a car accross the world canvas from left to right
; at the rate of three pixels per clock tick

(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))

(define CAR-BOTTOM
  (overlay/xy BOTH-WHEELS (* WHEEL-RADIUS -0.5) (* WHEEL-RADIUS -1)
              (rectangle (* WHEEL-DISTANCE 2) (* WHEEL-RADIUS 2) "solid" "red")))
(define CAR
  (overlay/xy CAR-BOTTOM (* WHEEL-RADIUS 2.5) (* WHEEL-RADIUS -1)
              (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "red")))

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))
(define BACKGROUND (overlay/xy tree -50 0 (rectangle WIDTH-OF-WORLD (* WHEEL-RADIUS 5) "outline" "black")))
(define Y-CAR (* WHEEL-RADIUS 3))



; WorldState is a Number
; interpretation the number of pixels between the left border and the car

; render

; clock-tick-handler
; key-stroke-handler
; mouse-event-handler

; end?

; WorldState -> Image
; places the image of the car x pixels from the left margin of
; the BACKGROUND image
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))

; WorldState -> WorldState
; moves the car by three pixels every time the clock ticks
; example:
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock ws)
  (+ ws 3))

; end? :
; WorldState -> Boolean
; after the car has been moved 3 pixels to the right, big-bang evaluates (end? cw)
; to see if the car has reached the right side of the BACKGROUND
; example:
(check-expect (end? 20) false)
(check-expect (end? WIDTH-OF-WORLD) true)
(define (end? ws)
  (if (>= ws WIDTH-OF-WORLD) true false))

; WorldState Number Number String -> WorldState
; places the car at the x-coordinate if me is "button-down"
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [on-mouse hyper]
            [to-draw render]
            [stop-when end?]))
(main 15)
