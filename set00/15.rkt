;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 15
(define-struct student (id name major))
; A Student is a (make-student Number String String)
; It represents a student at a school.
; Interpretation:
;   id    = the identification number of the student, unique to each student
;   name  = the first and last name of the student given as "Last, First"
;   major = the academic major of the student eg: "Computer Science"