;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 10
; two-largest-sum : Number Number Number -> Number
; GIVEN: three numbers in any order
; RETURNS: the sum of the largest two numbers
; Examples:
; (two_largest_sum 1 2 3)    => 5
; (two_largest_sum -8 7 -3)  => 4
; (two_largest_sum 0 0 0)    => 0
; (two_largest_sum 100 2 99) => 199
(define (two-largest-sum a b c)
  (cond
    ; check if a is greater than b
    [(> a b)
     (cond
       [(> b c) (+ a b)]
       [else (+ a c)]
       )
     ]
     ; check if a is greater than c--if it got here, then c is smallest
     [(> a c) (+ a b)]
     ; a must be smaller than both so add b and c
     [else (+ b c)]
     )
  )