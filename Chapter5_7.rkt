;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter5_7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct ball [location velocity])

; Exercise 76 formulate data definitions

; Movie is (make-movie String String Number(4))
(define-struct movie [title producer year])

; Person is (make-person String Color Color Number(10))
(define-struct person [name hair eyes phone])

; Pet is (make-pet String Number)
(define-struct pet [name number])

; CD is (make-CD String String Number(*.,,))
(define-struct CD [artist title price])

; sweater is (make-sweater String Number String)
(define-struct sweater [material size producer])

; time-after-midnight is (make-time-after-midnight Number(0-24) Number(0-60) Number(0-60))
(define-struct time-after-midnight [hours minutes seconds])

; three-letter-word is (make-three-letter-word (String1 or #false) (String1 or #false) (String1 or #false))
(define-struct three-letter-word [letter1 letter2 letter3])

; Examples of data definitions

; A Color is one of:
; - "white"
; - "yellow"
; - "orange"
; - "green"
; - "red"
; - "blue"
; - "black"
"black"
"green"
"orange"

; H (a "happiness scale value") is a number in [0, 100],
; i.e., a nmber between 0 and 100
0
100
43

(define-struct person2 [fstname lstname male?])
; Person is (make-person2 String String Boolean)
(make-person2 "Job" "Bible" #false)
(make-person2 "Vir" "Panday" #true)

(define-struct dog [owner name age happiness])
; Dog is (make-dog Person String PositiveInteger H)
(make-dog (make-person2 "Job" "Bible" #false) "Fluffy" 3 43)
; Interpretation: a dog has a person as an owner, a name, age and
; level of happiness.

; Weapon is one of:
; - #false
; - Posn
; interpretation #false means the missile hasn't been fired yet;
; an instance of Posn means the missile is in flight
(make-weapon #false)
(make-weapon (make-posn 10 20))
