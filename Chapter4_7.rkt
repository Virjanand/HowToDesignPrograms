;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter4_7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; define constants


; define graphic constants
(define BULB-SIZE 5)
(define LENGTH (* 10 BULB-SIZE))
(define HEIGHT (* 4 BULB-SIZE))

; TrafficLight state -> Image
; draws the bulb (circle) with color TrafficLight solid if on outline if off
(check-expect (bulb "red" "on") (circle BULB-SIZE "solid" "red"))
(check-expect (bulb "red" "off") (circle BULB-SIZE "outline" "red"))
(check-expect (bulb "yellow" "on") (circle BULB-SIZE "solid" "yellow"))
(check-expect (bulb "yellow" "off") (circle BULB-SIZE "outline" "yellow"))
(check-expect (bulb "green" "on") (circle BULB-SIZE "solid" "green"))
(check-expect (bulb "green" "off") (circle BULB-SIZE "outline" "green"))
(define (bulb color state)
  (cond
    [(string=? state "on") (circle BULB-SIZE "solid" color)]
    [(string=? state "off") (circle BULB-SIZE "outline" color)]))

; TrafficLight -> TrafficLight
; determines the next state of the traffic light, given s
(check-expect (tl-next "red") "green")
(check-expect (tl-next "green") "yellow")
(check-expect (tl-next "yellow") "red")
(define (tl-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; TrafficLight -> Image
; renders the current state of the traffic light as an image
(check-expect (tl-render "red") (place-image (bulb "red" "on")
                            10 10
                            (place-image (bulb "yellow" "off") 25 10
                            (place-image (bulb "green" "off") 40 10
                            (rectangle LENGTH HEIGHT "outline" "black")))))
(check-expect (tl-render "yellow") (place-image (bulb "red" "off")
                            10 10
                            (place-image (bulb "yellow" "on") 25 10
                            (place-image (bulb "green" "off") 40 10
                            (rectangle LENGTH HEIGHT "outline" "black")))))
(check-expect (tl-render "green") (place-image (bulb "red" "off")
                            10 10
                            (place-image (bulb "yellow" "off") 25 10
                            (place-image (bulb "green" "on") 40 10
                            (rectangle LENGTH HEIGHT "outline" "black")))))
(define (tl-render current-state)
  (cond
    [(string=? current-state "red") (place-image (bulb "red" "on")
                            10 10
                            (place-image (bulb "yellow" "off") 25 10
                            (place-image (bulb "green" "off") 40 10
                            (rectangle LENGTH HEIGHT "outline" "black"))))]
    [(string=? current-state "yellow") (place-image (bulb "red" "off")
                            10 10
                            (place-image (bulb "yellow" "on") 25 10
                            (place-image (bulb "green" "off") 40 10
                            (rectangle LENGTH HEIGHT "outline" "black"))))]
    [(string=? current-state "green") (place-image (bulb "red" "off")
                            10 10
                            (place-image (bulb "yellow" "off") 25 10
                            (place-image (bulb "green" "on") 40 10
                            (rectangle LENGTH HEIGHT "outline" "black"))))]))

; TrafficLight -> TrafficLight
; simulates a traffic light that changes with each clock tick
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
            [to-draw tl-render]
            [on-tick tl-next 1]))

; A N-TrafficLight shows one of three colors:
; - 0
; - 1
; - 2
; interpretation 0 means the traffic light shows red,
; 1 green, and 2 yellow

; N-TrafficLight -> N-TrafficLight
; determines the next state of the traffic light, given current-state
(check-expect (tl-next-numeric 0) 1)
(check-expect (tl-next-numeric 1) 2)
(check-expect (tl-next-numeric 2) 0)
(define (tl-next-numeric current-state)
  (modulo (+ current-state 1) 3))