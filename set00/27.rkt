;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |27|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 27

(require 2htdp/image)
(require rackunit)

; draw-text : ListOfString -> Image
; GIVEN: a list of Strings
; RETURNS: an Image containing the combined list of String, where each string is separated by a space char
; Examples:
; (draw-text empty) => (text "" 15 "red")
; (draw-text (list "This" "is" "a" "test.")) => (text "This is a test." 15 "red")
; (draw-text (list "This" "is" "only" "a" "test.")) => (text "This is only a test." 15 "red")
; DESIGN STRATEGY: Function Composition
(define (draw-text lst)
  (text (append-list lst) 15 "red")
  )

; append-list : ListOfString -> String
; GIVEN: a list of Strings
; RETURNS: a String of each list element concatenated, with a space between each element
; Examples:
; (append-list empty) => ""
; (append-list (list "This" "is" "a" "test.")) => "This is a test."
; (append-list (list "This" "is" "only" "a" "test.")) => "This is only a test."
; DESIGN STRATEGY: Cases
(define (append-list lst)
  (cond
    [(empty? lst) ""]
    [(equal? 1 (length lst)) (first lst)]
    [else (string-append (first lst) " " (append-list (rest lst)))]
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

; Tests for append-list
 (check-equal?
  (append-list empty)
  ""
  )

 (check-equal?
  (append-list (list "This" "is" "a" "test."))
  "This is a test."
  )

 (check-equal?
  (append-list (list "This" "is" "only" "a" "test."))
  "This is only a test."
  )
)