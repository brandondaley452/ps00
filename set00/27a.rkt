;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 27a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 27a

(require 2htdp/image)
(require rackunit)

; draw-text : ListOfString -> Image
; GIVEN: a list of Strings
; RETURNS: an Image containing the combined list of String, where each string is separated by a space char
; Examples:
; (draw-text empty) => (text "" 15 "red")
; (draw-text (list "This" "is" "a" "test.")) => (text "This is a test." 15 "red")
; (draw-text (list "This" "is" "only" "a" "test.")) => (text "This is only a test." 15 "red")
; DESIGN STRATEGY: Cases
(define (draw-text lst)
  (cond
    ; first base case: empty list
    [(empty? lst) (text "" 15 "red")]
    ; second base case: only one word remaining in the list
    [(equal? 1 (length lst)) (text (first lst) 15 "red")]
    ; else, there are more words that need to be recursed through
    [else (beside
           (text (string-append (first lst) " ") 15 "red")  
           (draw-text (rest lst))
           )
          ]
    )
  )

; Tests for draw-text
(test-begin
 (check-equal?
  (draw-text empty)
  (text "" 15 "red")
  )

 (check-equal?
  (draw-text (list "This" "is" "a" "test."))
  (text (string-append "This is a test." "") 15 "red")
  )

 (check-equal?
  (draw-text (list "This" "is" "only" "a" "test."))
  (text "This is only a test." 15 "red")
  )
 )