<?php

// Simple math
function plus($a, $b) {
  return $a + $b;
}

function minus($a, $b) {
  return $a - $b;
}

function multiply($a, $b) {
  return $a * $b;
}

function devide($a, $b) {
  if ($b === 0) return "Can't devide by 0.";
  return $a / $b;
}

// Math functions
function powerOf($a, $b) {
  return pow($a, $b);
}

function root($a, $b) {
  return pow($a, 1 / $b);
}

function logarithm($a) {
  return log($a);
}

function exponent($a) {
  return exp($a);
}