;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 12
;
; Predictions for function calls:
; 
; (make-point 5 3)             -> (make-point 5 3) -> CORRECT PREDICTION
; (point? 5)                   -> false            -> CORRECT PREDICTION
; (point? true)                -> false            -> CORRECT PREDICTION
; (point? (make-point 2 1))    -> true             -> CORRECT PREDICTION
; (point-x (make-point 8 5))   -> 8                -> CORRECT PREDICTION
; (point-y (make-point 42 15)) -> 15               -> CORRECT PREDICTION
