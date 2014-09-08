;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)

; Ex 4
; tip : NonNegNumber Number[0.0,1.0] -> Number
; GIVEN: the amount of the bill in dollars and the
; percentage of tip
; RETURNS: the amount of the tip in dollars.
; Examples:
; (tip 10 0.15)  => 1.5
; (tip 20 0.17)  => 3.4
(define (tip billTotal tipAmt)
  (if (and (> billTotal 0) (>= tipAmt 0) (<= tipAmt 1))
      (* billTotal tipAmt)
      "The total bill amount must be greater than $0.00 and the tip amount must be between 0%-100%."
      )
  )

; Tests for tip
(test-begin
 (check-equal?
   (tip 10 0.15)
   1.5
   )

 (check-equal?
   (tip 20 0.17)
   3.4
   )
 )
