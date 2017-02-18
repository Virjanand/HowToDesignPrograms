;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter4_5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; WorldState is a LR
; A LR (short for: launching rocket) is one of:
; – "resting"
; – non-negative number 
; interpretation "resting" represents a rocket on the ground
; a number denotes the height of a rocket in flight

; constants:
(define WIDTH 200)
(define HEIGHT 100)

; visual constants
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))


(define ROCKET-HEIGHT (image-height ROCKET))

; WorldState -> WorldState
(place-image ROCKET (/ WIDTH 2) (- HEIGHT (/ ROCKET-HEIGHT 2)) BACKG)
(place-image ROCKET (/ WIDTH 2) (- ROCKET-HEIGHT (/ ROCKET-HEIGHT 2)) BACKG)
(place-image ROCKET (/ WIDTH 2) (- 50 (/ ROCKET-HEIGHT 2)) BACKG)

