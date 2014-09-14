;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |25|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 25
; all-true : ListOfBoolean -> Boolean
; GIVEN: a list of boolean values
; RETURNS: true if all values in list are true; false otherwise
; Examples: 
; (all-true empty) = true
; (all-true (list true)) = true
; (all-true (list false) = false
; (all-true (list true false) = false
; (all-true (list true true) = true
(define (all-true lst)
  (cond
    [(empty? lst) true]
    [else (and (first lst) (all-true (rest lst)))]
    )
  )