<?php

/**
 * Class Media
 */
abstract class Media {

  public $title;

  public $duration;

  public function __construct($title = 'untitled', $duration = 0) {
    $this->title    = $title;
    $this->duration = $duration;
  }

  abstract public function getGenres();

}

/**
 * Class Music
 */
class Music extends Media {

  public $artist;

  private $album;

  private $genres;

  public function __construct($title = 'untitled', $duration = 0, $artist = 'no artist', $album = 'no album', $genres = []) {
    parent::__construct($title, $duration);
    $this->artist = $artist;
    $this->album  = $album;
    $this->genres = $genres;
  }

  public function getAlbum() {
    return $this->album;
  }

  public function setAlbum($album) {
    $this->album = $album;
  }

  public function getGenres() {
    foreach ($this->genres as $genreItem) {
      echo $genreItem;
    }
  }
}

/**
 * Class Movie
 */
class Movie extends Media {

  public $rating;

  public $director;

  private $genres;

  public function __construct($rating, $director, $genres, $title, $duration) {
    parent::__construct($title, $duration);
    $this->rating   = $rating;
    $this->director = $director;
    $this->genres   = $genres;
  }

  public function getGenres() {
    $formattedMovies = [];
    foreach ($this->genres as $genreItem) {
      $formattedMovies[] = $genreItem . " movie.";
    }
  }

}
