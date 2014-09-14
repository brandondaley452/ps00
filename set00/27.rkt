;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |27|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 27

(require 2htdp/image)

; draw-text : ListOfString -> Image
; GIVEN: a list of Strings
; RETURNS: an Image containing the combined list of String, where each string is separated by a space char
; Examples: 
(define (draw-text lst)
  (text (append-list lst) 15 "red")
  )

(define (append-list lst)
  (cond
    [(empty? lst) ""]
    [else (string-append (first lst) " " (append-list (rest lst)))]
    )
  )