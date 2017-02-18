;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter5_6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; Sample problem: Your team is designing an interactive game program that
; moves a red dot accross a 100 x 100 canvas and allows players to use the
; mouse to place the dot.

; visual constants
(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

; The state of the world is represented by a Posn.

; Posn -> Image
; adds a red spot to MTS at p
(check-expect (scene+dot (make-posn 10 20))
              (place-image DOT 10 20 MTS))
(check-expect (scene+dot (make-posn 88 73))
              (place-image DOT 88 73 MTS))
(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))

; Posn -> Posn
; increase the x-coordinate of p by 3
(check-expect (x+ (make-posn 10 0)) (make-posn 13 0))
(define (x+ p)
  (make-posn (+ (posn-x p) 3) (posn-y p)))

; Posn Number -> Posn
; Create Posn with Number n in x field
(check-expect (posn-up-x (make-posn 10 10) 20) (make-posn 20 10))
(define (posn-up-x posn n)
  (make-posn n (posn-y posn)))

; Posn Number Number MouseEvt -> Posn
; for mouse clicks, (make-posn x y); otherwise p
(check-expect (reset-dot (make-posn 10 20) 29 31 "button-down")
              (make-posn 29 31))
(check-expect (reset-dot (make-posn 10 20) 29 31 "button-up")
              (make-posn 10 20))
(define (reset-dot p x y me)
  (cond
    [(mouse=? "button-down" me) (make-posn x y)]
    [else p]))

; Posn -> Posn
(define (main p0)
  (big-bang p0
    [on-tick x+]
    [on-mouse reset-dot]
    [to-draw scene+dot]))