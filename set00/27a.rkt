;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 27a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 27a

(require 2htdp/image)

(define (draw-text lst)
  (cond
    ; base case: only one word remaining in the list
    [(equal? 1 (length lst)) (text (first lst) 15 "red")]
    ; else, there are more words that need to be recursed through
    [else (beside
           (text (string-append (first lst) " ") 15 "red")  
           (draw-text (rest lst))
           )
          ]
    )
  )