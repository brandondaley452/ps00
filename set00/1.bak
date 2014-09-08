;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 1
; Illustrates nesting of arguments
(* 366 (* 24 (* 60 60)))
; Illustrates how we can use multiple arguments
(* 366 24 60 60)
; Constants to describe time
(define regYearDays 365)
(define leapDay 1)
(define hrsInDay 24)
(define minInHr 60)
(define secInMin 60)
; Formula using time constants that sums seconds in a regular year and seconds in a leap day
(+ (* regYearDays hrsInDay minInHr secInMin)
   (* leapDay hrsInDay minInHr secInMin)
   )
