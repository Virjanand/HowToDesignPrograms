;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter2_5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)
(define (number->square s)
  (square s "solid" "red"))
(define (reset s ke)
  100)
(big-bang 100
          [to-draw number->square]
          [on-tick sub1]
          [stop-when zero?]
          [on-key reset])
(big-bang cw0
          [on-tick tock]
          [on-key ke-h]
          [on-mouse me-h]
          [to-draw render]
          [stop-when end?])

