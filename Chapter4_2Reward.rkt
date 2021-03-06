;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter4_2Reward) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (reward s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (<= s 20)) "silver"]
    [else "gold"]))

;(reward 18)
(define y 210)
(- 200 (cond
        [(> y 200) 0]
        [else y]))

(define (create-rocket-scene.v5 h)
  (place-image ROCKET 50
               (cond
                 [(<= h ROCKET-CENTER-TO-BOTTOM) h]
                 [else ROCKET-CENTER-TO-BOTOM]
               MTSCN)))