;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter3_7HappinessGauge) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; Contstants
(define BAR-WIDTH 20)
(define BAR-HEIGHT 100)
(define BLACK (rectangle BAR-WIDTH BAR-HEIGHT "solid" "black"))

; Data definition
; WorldState is a Number
; interpretation: the happiness level of the cat

; functions
; render
; WorldState -> Image
; places a red bar at height ws over the black background
(define (render ws)
  (place-image (rectangle BAR-WIDTH ws "solid" "red") (floor (/ BAR-WIDTH 2)) (+ (floor (/ BAR-HEIGHT 2)) (/ (- BAR-HEIGHT ws) 2)) BLACK))

; clock-tick-handler
; WorldState -> WorldState
; removes 0.1 from happiness level
(define (tock ws)
  (- ws 0.1))

; key-pressed-handler
; WorldState String -> WorldState
; for each stroke down happiness increases by 1/5 every time up is pressed
; happiness increases by 1/3
(define (key-pressed cw ke)
  (cond
    [(string=? "up" ke) (increase cw 3)]
    [(string=? "down" ke) (increase cw 5)]
    [else cw]))

; WorldState -> WorldState
; increase the WorldState by 1/fraction 1/f, but not over BAR-HEIGHT
(check-expect (increase 30 3) 40)
(check-expect (increase 100 3) BAR-HEIGHT)
(define (increase cw f)
  (cond
    [(>= (+ cw (floor (/ cw f))) BAR-HEIGHT) BAR-HEIGHT]
    [(< (+ cw (floor (/ cw f))) BAR-HEIGHT) (+ cw (floor (/ cw f)))])
)
; main
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]
            [on-key key-pressed]
            [stop-when zero?]))