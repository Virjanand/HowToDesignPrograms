;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter3_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require htdp/image)

; We use strings to represent words
; string -> string1
; extracts first character from s
; given:
; "Hello" for s,
; expected:
; H
(define (string-first s)
  (substring s 0 1))

; We use strings to represent words
; string -> string1
; extracts last character from s
; given:
; "Hello" for s,
; expected:
; o
(define (string-last s)
  (substring s (- (string-length s) 1) (string-length s)))

; We use numbers to represent area of a square and
; height and width of an image.
; image -> number
; calculate area of img
; given:
; (rectangle 40 40 "solid" "red")
; expected:
; 1600
(define (image-area img)
  (* (image-height img) (image-width img)))

; We use strings to represent words
; string -> string
; return string with first character removed
; given:
; "Hello"
; expected:
; "ello"
(define (string-rest str)
  (substring str 1 (string-length str)))

; We use strings to represent words
; string -> string
; return string with last character removed
; given:
; "Hello"
; expected:
; "Hell"
(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))