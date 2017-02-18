;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter2_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;How to Design Programs Exercise 24
(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))
(distance-to-origin 3 4)

;How to Design Programs Exercise 25
(define (string-first s)
  (substring s 0 1))
(string-first "hello world")

;How to Design Programs Exercise 26
(define (bool-imply x y)
  (or (not x) y))
(bool-imply #true #false)

;How to Design Programs Exercise 27
(define (image-classify img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))
(image-classify (circle 3 "solid" "red"))

;How to Design Programs Exercise 28
(define (string-insert s i)
  (string-append (substring s 0 i) "_" (substring s i)))
(string-insert "helloworld" 6)