;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter4_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; TrafficLight -> TrafficLight
; determines the next state of the traffic light from the given s
 
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
 
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; tock
; WorldState -> WorldState
; Changes the traffic light from red to green to yellow to red every
; time the clock ticks
(check-expect (tock "red") "green")
(check-expect (tock "green") "yellow")
(check-expect (tock "yellow") "red")
(define (tock ws) (traffic-light-next ws))

;render
; WorldState -> Image
; draws a circle of color ws
(check-expect (render "red") (circle 30 "solid" "red"))
(check-expect (render "green") (circle 30 "solid" "green"))
(check-expect (render "yellow") (circle 30 "solid" "yellow"))
(define (render ws)
  (circle 30 "solid" ws))


; main
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))

(main "red")