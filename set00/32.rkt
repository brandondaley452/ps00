;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |32|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 32

(define (total-distance pointList)
  (cond
    [(empty? pointList) 0]
    [else (+ (distance (first pointList)) (total-distance (rest pointList)))]
    )
  )

(define (distance point)
  (+ (abs (posn-x point)) (abs (posn-y point)))
  )