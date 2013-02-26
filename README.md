CS193P-Attribute
================

iPhone demo for NSAttributedString in UILabel and UITextView, showing likely bug in the Apple implementation of the latter.
Taken from Paul Hegarty's demo from Stanford University, CS193P (winter 2013).

This repository contains two branches:

1) master: this version uses an UILabel with an NSAttributedString for the main sentence.  The outline and no outline 
buttons work as expected.

2) UITextView: this version replaces the UILabel with an UITextView in the main storyboard and the relative outlet.  
Outline now no longer works, just blanks out the selected word.  Why?
