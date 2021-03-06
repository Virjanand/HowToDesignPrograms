;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter2_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

(define (letter fst lst signature-name)
  (string-append
   (opening fst)
   "\n\n"
   (body fst lst)
   "\n\n"
   (closing signature-name)))

(define (opening fst)
  (string-append "Dear " fst ","))

(define (body fst lst)
  (string-append
   "We have discovered that all people with the last name " "\n"
   lst " have won our lottery. So, " fst ", " "\n"
   "hurry and pick up your prize."))

(define (closing signature-name)
  (string-append
          "Sincerely,"
          "\n\n"
          signature-name
          "\n"))

;How to Design Programs Exercise 29

(define base-attendence 120)
(define base-ticket-price 5.0)
(define base-price-increase 0.1)
(define base-people-decrease 15)
(define base-cost 180)
(define cost-per-person 0.04)

(define (attendees ticket-price)
  (- base-attendence (* (- ticket-price base-ticket-price)
                        (/ base-people-decrease base-price-increase))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ base-cost (* cost-per-person (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
