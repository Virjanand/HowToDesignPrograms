;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter5_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct entry [name phone email])
; An Entry is a structure: (make-entry String String String)
; interpretation a contact's name, 7-digit phone#, and email address

(define pl
  (make-entry "Sarah Lee" "666-7771" "lee@classy-university.edu"))

(define bh
  (make-entry "Tara Harper" "666-7770" "harper@small-college.edu"))

(define-struct movie [title producer year])
; constructor: make-movie
; selectors: movie-title, movie-producer, movie-year
; predicates: movie?

(define-struct person [name hair eyes phone])
; constructor: make-person
; selectors: person-name, person-hair, person-eyes, person-phone
; predicates: person?

(define-struct pet [name number])
; constructor: make-pet
; selectors: pet-name, pet-number
; prediates: pet?

(define-struct CD [artist title price])
; constructor: make-CD
; selectors: CD-artist, CD-title, CD-price
; predicates: CD?

(define-struct sweater [material size producer])
; constructor: make-sweater
; selectors: sweater-material, sweater-size, sweater-producer
; predicates: sweater?

; (make-movie "kill bill" "quintin" 2000)

; (make-person "Virjanand" "long" "brown" 0636182856)

; (make-pet "billy" 03)

; (make-CD "prince" "whatever" 24.95)

; (make-sweater "Cotton" "L" "Thai")

(define-struct ball [location velocity])
; A Ball-1d is a structure: (make-ball Number Number)
; interpretation 1 the position from top and the velocity
; interpretation 2 the position from left and the velocity

; Another way to represent bouncing balls:
; The speed of the ball is set in a constant
; the direction is set in the constructor
(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")

(define-struct vel [deltax deltay])

(define ball1 (make-ball (make-posn 30 40) (make-vel -10 5)))

; flat representation of ball:
(define-struct ballf [x y deltax deltay])

(make-ballf 30 40 -10 5)

; interlude with contact list
(define-struct centry [name home office cell])
; Laws introduced by structure type definition
; (centry-name (make-centry n0 h0 o0 c0)) == n0
; (centry-home (make-centry n0 h0 o0 c0)) == h0
; (centry-office (make-centry n0 h0 o0 c0)) == o0
; (centry-cell (make-centry n0 h0 o0 c0)) == c0

(define-struct phone [area number])
; Laws introduced by structure type definition
; (phone-area (make-phone a0 n0)) == a0
; (phone-number (make-phone a0 n0)) == n0

; A phone is a structure: (make-phone Number String)
; interpretation a phone number with an area code number
; and a string of numbers devided by a dash -

(define-struct phone# [area switch num])
; A phone# is a structure: (make-phone# Number Number Number)
; interpretation a phone number with an area code,
; a switch and the phone number wrt the switch
; area falls into the interval between 000 and 999
; switch falls into the interval between 000 and 999
; num falls into the interval betwen 0000 and 9999

(phone-area
 (centry-office
  (make-centry
   "Shriram Fisler"
   (make-phone 207 "363-2421")
   (make-phone 101 "776-1099")
   (make-phone 208 "112-9981"))))
; ==
(phone-area
   (make-phone 101 "776-1099"))
; ==
101
   
   

(make-centry "shriram Fisler"
             (make-phone 207 "363-2321")
             (make-phone 101 "776-1099")
             (make-phone 208 "112-9981"))

(make-entry "Sarah Lee" "666-7771" "lee@classy-university.edu")

(make-entry "Tara Harper" "666-7770" "harper@small-college.edu")

(entry-name pl)

;(entry-name (make-posn 42 5))

(ball-velocity ball1)

(vel-deltax (ball-velocity ball1))

(define a-posn (make-posn 7 0))

;(define pl (make-entry "Sarah Lee" "666-7771" "lee@classy-university.edu"))

(define HEIGHT 200)
(define MIDDLE (quotient HEIGHT 2))
(define WIDTH 400)
(define CENTER (quotient WIDTH 2))

(define-struct game [left-player right-player ball])

(define game0
  (make-game MIDDLE MIDDLE (make-posn CENTER CENTER)))

(game-ball game0)
; ==
(game-ball
 (make-game MIDDLE MIDDLE (make-posn CENTER CENTER)))
; ==
(make-posn CENTER CENTER)
; ==
(make-posn (quotient WIDTH 2) (quotient WIDTH 2))
; ==
(make-posn (quotient 400 2) (quotient 400 2))
; ==
(make-posn 200 200)

(posn? (game-ball game0))
; ==
(posn? (game-ball
        make-game 100 100 (make-posn 200 200)))
; ==
(posn? (make-posn 200 200))
; ==
#true

(game-left-player game0)