;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter1&2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;How to Design Programs Exercis 11
(define in -1)
(if (string? in) (string-length in) (if (image? in) (* (image-width in) (image-height in))
     (if (number? in) (if (> in 0) (- in 1) in) (if in 10 20))))

;Trying out
(define (f x) 1)

(define (ff a) (* 10 a))

;How to Design Programs Exercise 13
(define (distance x y) (sqrt (+(sqr x) (sqr y))))

;How to Design Programs Exercise 14
(define (cube-volume side) (expt side 3))
(define (cube-surface side) (* 6 (sqr side)))

;How to Design Programs Exercise 15
(define (string-first inputString) (string-ith inputString 0))

;How to Design Programs Exercise 16
(define (string-last inputString) (string-ith inputString (- (string-length inputString) 1)))

;How to Design Programs Exercise 17
(define (bool-imply sunny friday) (or (not sunny) friday))

;How to Design Programs Exercise 18
(define (image-area im) (* (image-height im) (image-width im)))

;How to Design Programs Exercise 19
(define (image-classify im) (if (<(image-width im) (image-height im)) "tall" (if (>(image-width im) (image-height im)) "wide" "square"))
)

;How to Design Programs Exercise 20
(define (string-join str1 str2) (string-append (string-append str1 "_") str2))

;How to Design Programs Exercise 21
(define (string-insert str i) (string-join (substring str 0 i) (substring str i)))
;How to deal with empty string? - Perhaps with string-length > i.

;How to Design Programs Exercise 22
(define (string-delete str i) (string-append (substring str 0 i) (substring str (+ i 1) (string-length str))))

;How to Design Programs Exercise 23


