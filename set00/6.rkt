;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 6 (next four definitions)
; quadratic-root : Number Number Number -> Number
; GIVEN: a, b, and c as constants of equation 
; RETURNS: positive quadratic root of the equation
; Examples:
; (quadratic-root 1 -3 -4)  => 4  
; (quadratic-root 1 0 -4)   => 2
; (quadratic-root 6 11 -35) => 1.6666666666
(define (quadratic-root a b c)
  (/ (top-quad a b c) (bottom-quad a))
  )

; HELPER FUNCTION
; top-quad : Number Number Number -> Number
; GIVEN: a, b, and c as constants of equation 
; RETURNS: value of top part of quadratic-root equation
; (top-quad 1 -3 -4)  => 8 
; (top-quad 1 0 -4)   => 4
; (top-quad 6 11 -35) => 20
(define (top-quad a b c)
  (+ (* -1 b) (sqrt (under-root a b c)))
  )

; HELPER FUNCTION
; bottom-quad : Number -> Number
; GIVEN: a as constant of equation 
; RETURNS: value of bottom part of quadratic-root equation
; Examples:
; (bottom-quad 1)  => 1  
; (bottom-quad 5)  => 10
; (bottom-quad -8) => -16
(define (bottom-quad a)
  (* 2 a)
  )

; HELPER FUNCTION
; under-root : Number Number Number -> Number
; GIVEN: a, b, and c as constants of equation 
; RETURNS: value underneath sqrt of quadratic equation
; Examples:
; (under-root 1 -3 -4)  => 25  
; (under-root 1 0 -4)   => 16
; (under-root 6 11 -35) => 961
(define (under-root a b c)
  (- (sqr b) (* 4 a c))
  )