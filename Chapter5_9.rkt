;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter5_9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct space-game [ufo tank])
; space-game is (make-space-game Number Number)
; interpretation the first Number is the y-coordinate
; of the ufo and the second Number is the x-coordinate
; of the tank

(define exgame1 (make-space-game 0 0))
(define exgame2 (make-space-game 15 22))

; selector names space-game
(space-game-ufo exgame1)
(space-game-tank exgame2)

; predicate space-game
(space-game? exgame1)

; SpaceGame is (make-space-game Posn Number).
; interpretation (make-space-game (make-posn ux uy) tx) means that the
; UFO is currently at (ux, uy) and the tank's x-coordinate is tx
