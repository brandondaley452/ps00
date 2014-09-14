;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |32|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 32

(require rackunit)

; distance : Posn -> NonNegInt
; GIVEN: a Posn with x- and y- coordinates
; RETURNS: a NonNegInt representing the Manhattan distance
;          of the position from coordinate (0, 0)
; Examples:
; (distance (make-posn 0 0)) => 0
; (distance (make-posn 5 3)) => 8
; (distance (make-posn -6 8)) => 14
; DESIGN STRATEGY: Function Composition
(define (distance point)
  (+ (abs (posn-x point)) (abs (posn-y point)))
  )

; total-distance : ListOfPosn -> NonNegInt
; GIVEN: a list of Posn with corresponding x- and y- coordinates
; RETURNS: the combined distance from (0, 0) of all Posns in the list
; Examples:
; (total-distance empty) => 0
; (total-distance (list (make-posn 5 3))) => 8
; (total-distance (list (make-posn 5 3) (make-posn -6 8))) => 22
; DESIGN STRATEGY: Cases
(define (total-distance pointList)
  (cond
    [(empty? pointList) 0]
    [else (+ (distance (first pointList)) (total-distance (rest pointList)))]
    )
  )

(test-begin
 ; Tests for distance
 (check-equal?
  (distance (make-posn 0 0))
  0
  )
 
 (check-equal?
  (distance (make-posn 5 3))
  8
  )
 
 (check-equal?
  (distance (make-posn -6 8))
  14
  )
 
 ; Tests for total-distance
 (check-equal?
  (total-distance empty)
  0
  )
 
 (check-equal?
  (total-distance (list (make-posn 5 3)))
  8
  )
 
 (check-equal?
  (total-distance (list (make-posn 5 3) (make-posn -6 8)))
  22
  )
 )