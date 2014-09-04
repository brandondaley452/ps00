;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 9
; even? : Number -> Boolean
; GIVEN: an arbitrary number 
; RETURNS: true if number is divisible by 2, else false
; Examples:
; (even? 1)    => false
; (even? 2)    => true
; (even? 4)    => true
; (even? -9)   => false
; (even? -104) => true
(define (even? arg)
  (= (remainder arg 2) 0)
  )