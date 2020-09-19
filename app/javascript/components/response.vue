<template>
  <div class="response">
    <h2 class="response__title">{{ title }}</h2>
    <div class="response__play-again-container">
      <button
        class="response__play-again"
        @click="$emit('play-again')"
      >
        Play Again?
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: {
    correct: {
      type: Boolean,
      required: true
    }
  },
  computed: {
    title: function() {
      return this.correct ? 'Correct!' : 'Wrong!'
    },
  },
}
</script>

<style>
@font-face {
  font-family: "Pixel";
  src: url("../assets/fonts/pixel.ttf") format("truetype")
}

.response {
  padding: 24px;
}

.response__title {
  margin-bottom: 16px;

  color: #FFFFFF;
  font-family: 'Pixel', sans-serif;
  font-size: 2em;
  text-align: center;
  text-shadow: 1px 3px 0px #000000;
}

.response__play-again-container {
  display: flex;
  justify-content: center;
}

.response__play-again {
  display: block;

  margin: 8px;
  padding: 12px 24px;

  border: 2px solid #FFFFFF;
  background-color: #7986CB;
  box-shadow: 1px 1px 0px #000000;

  color: #FFFFFF;
  font-family: 'Pixel', sans-serif;
  font-size: 1.3em;
  text-align: center;
  text-shadow: 1px 2px 0px #000000;
  text-decoration: none;

  transition: background 250ms ease-in-out, transform 150ms ease;

  cursor: pointer;

  -webkit-appearance: none;
  -moz-appearance: none;
}

.response__play-again:hover,
.response__play-again:focus {
    background: #AAB6FE;
}

.response__play-again:focus {
    outline: 1px solid #FFFFFF;
    outline-offset: -4px;
}

.response__play-again:active {
    transform: scale(0.95);
}

@media (min-width: 480px) {
  .response__play-again {
    margin: 24px;
    padding: 16px 32px;
  }
}
</style>
