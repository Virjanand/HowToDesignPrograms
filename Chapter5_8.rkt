;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter5_8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design a function that computes the distance of objects in a 3-
; dimensional space to the origin of the coordinate system

; data definition for structure type
; with examples

(define-struct r3 [x y z]) ; <-- structure type definition
; R3 is (make-r3 Number Number Number)  <-- data definition

; examples:
(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 -1 0 3))

; R3 -> Number <-- signature
; purpose statement: 
; determines the distance of p to the origin
(check-within (r3-distance-to-0 ex1) (sqrt 173) (sqrt 175))
(check-within (r3-distance-to-0 ex2) (sqrt 9) (sqrt 11))

(define (r3-distance-to-0 p)
  (sqrt (+ (sqr (r3-x p)) (+ (sqr (r3-y p)) (sqr (r3-z p))))))

; templates for functions that consume given structure types
(define-struct movie [title director year])

(define (watch-movie m)
  (... (movie-title m)....(movie-year m)...))


(define-struct person [name hair eyes phone])

;(define (call-person p)
;  (... (person-name p)...(person-phone p)))


(define-struct pet [name number])

;(define (feed-pet p)
;  (...(pet-name p)....))

(define-struct CD [artist title price])

;(define (buy-CD cd)
;  (...(CD-title cd)...(CD-price cd)))

(define-struct sweater [material size color])

;(define (wear-sweater sw)
;  (...(sweater-size sw)...(sweater-color sw)))

; time-after-midnight is (make-time-after-midnight Number(0-24) Number(0-60) Number(0-60))
(define-struct time-after-midnight [hours minutes seconds])

; time-after-midnight -> Number
; calculate seconds after midnight from time-after-midnight
(check-expect (time-to-sec (make-time-after-midnight 12 30 2)) 45002)

(define (time-to-sec time)
  (+ (* 60 60 (time-after-midnight-hours time))
     (* 60 (time-after-midnight-minutes time))
     (time-after-midnight-seconds time)))


; three-letter-word is (make-three-letter-word (String1 or #false) (String1 or #false) (String1 or #false))
(define-struct three-letter-word [letter1 letter2 letter3])

; letter, letter -> letter
; compare two letters and return the letter if they are equal and false
; if different
(check-expect (compare-letter "a" "a") "a")
(check-expect (compare-letter "a" "b") #false)
(define (compare-letter l1 l2)
  (if (string=? l1 l2) l1 #false))

; three-letter-word, three-letter-word -> three-letter-word
; compare two words and return the letters or false when the letters
; are the same or not respectively
(check-expect (compare-word (make-three-letter-word "a" "t" "v")
                            (make-three-letter-word "a" "t" "v"))
              (make-three-letter-word "a" "t" "v"))
(check-expect (compare-word (make-three-letter-word "a" "t" "v")
                            (make-three-letter-word "a" "t" "x"))
              (make-three-letter-word "a" "t" #false))
(define (compare-word w1 w2)
  (make-three-letter-word
  (compare-letter (three-letter-word-letter1 w1)
                  (three-letter-word-letter1 w2))
  (compare-letter (three-letter-word-letter2 w1)
                  (three-letter-word-letter2 w2))
  (compare-letter (three-letter-word-letter3 w1)
                  (three-letter-word-letter3 w2))))