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