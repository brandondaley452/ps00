;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)

; Ex 5
; sq : Number -> NonNegNumber
; GIVEN: number to compute a square for
; RETURNS: the square of the given number
; Examples:
; (sq 5)   => 25
; (sq 1)   => 1
; (sq -12) => 144
(define (sq num)
  (cond
    [(number? num) (expt num 2)]
    [else "This function requires a number as input."]
    )
  )

; Tests for sq
(test-begin
 (check-equal?
   (sq 5)
   25
   )

 (check-equal?
   (sq 1)
   1
   )

 (check-equal?
   (sq -12)
   144
  )
 )
