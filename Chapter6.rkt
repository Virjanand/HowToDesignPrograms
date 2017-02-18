;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Space invader game
(require 2htdp/universe)
(require 2htdp/image)

; Physical constants
(define WIDTH 200)
(define HEIGHT 200)
(define TANK-HEIGHT 7)


; Graphical constants
(define TANK (rectangle 20 TANK-HEIGHT "solid" "blue"))
(define UFO (ellipse 20 TANK-HEIGHT "solid" "green"))
(define ROCKET (triangle 5 "solid" "red"))

; Structures
(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])

; Data definitions

; A UFO is a Posn.
; interpretation (make-posn x y) is the UFO's location
; (using the top-down, left-to-right convention)

(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number)
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick

; A Missile is a Posn.
; interpretation (make-posn x y) is the missile's place

; A SIGS is one of:
; - (make-aim UFO Tank)
; - (make-fired UFO Tank Missile)
; interpretation represents the complete stat of a
; space invader game

; Examples:

; tank moving into position
(make-aim (make-posn 20 10) (make-tank 28 -3))

; tank moving into position missile fired
(make-fired (make-posn 20 10)
            (make-tank 28 -3)
            (make-posn 28 (- HEIGHT TANK-HEIGHT)))

; missile about to collide with UFO
(make-fired (make-posn 20 100)
            (make-tank 100 3)
            (make-posn 22 103))

