;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter5_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define p (make-posn 31 26))

; computes the distance of a-posn to the origin
(check-expect (distance-to-0 (make-posn 0 5)) 5)
(check-expect (distance-to-0 (make-posn 7 0)) 7)
(check-expect (distance-to-0 (make-posn 3 4 )) 5)
(check-expect (distance-to-0 (make-posn 8 6)) 10)
(check-expect (distance-to-0 (make-posn 5 12)) 13)

(define (distance-to-0 a-posn)
  (sqrt 
  (+ (sqr (posn-x a-posn))
   (sqr (posn-y a-posn)))))

; computes the manhattan distance of a-posn to the origin
(check-expect (manhattan-distance (make-posn 0 5)) 5)
(check-expect (manhattan-distance (make-posn 7 0)) 7)
(check-expect (manhattan-distance (make-posn 3 4)) 7)
(check-expect (manhattan-distance (make-posn 8 6)) 14)
(check-expect (manhattan-distance (make-posn 5 12)) 17)
 
(define (manhattan-distance a-posn)
  (+ (posn-x a-posn)
     (posn-y a-posn)))