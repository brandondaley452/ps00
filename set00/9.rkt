;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rackunit)

; Ex 9
; even-num? : Number -> Boolean
; GIVEN: an arbitrary number 
; RETURNS: true if number is divisible by 2, else false
; Examples:
; (even-num? 1)    => false
; (even-num? 2)    => true
; (even-num? 4)    => true
; (even-num? -9)   => false
; (even-num? -104) => true
(define (even-num? arg)
  (if (integer? arg)
      (= (remainder arg 2) 0)
      "The number provided must be an integer."
      )
  )
; NOTE: renamed function to even-num? to avoid conflicts with existing even? predicate

; Tests for even-num?
(test-begin
 (check-false
  (even-num? 1)
  )

 (check-true
  (even-num? 2)
  )

 (check-true
  (even-num? 4)
  )

 (check-false
  (even-num? -9)
  )

 (check-true
  (even-num? -104)
  )
 )
