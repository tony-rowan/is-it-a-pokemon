<template>
  <div class="question">
    <p class="question__body">{{ question.body | displayBody }}</p>
    <div class="question__option-container">
      <button
        class="question__option"
        @click="submitAnswer(false)"
      >
        No
      </button>
      <button
        class="question__option"
        @click="submitAnswer(true)"
      >
        Yes
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: {
    question: {
      type: Object,
      required: true
    }
  },
  filters: {
    displayBody: function(body) {
      return body.charAt(0).toUpperCase() + body.slice(1)
    }
  },
  methods: {
    submitAnswer: function(real) {
      this.$emit('answer', real)
    }
  }
}
</script>

<style>
@font-face {
  font-family: "Pixel";
  src: url("../assets/fonts/pixel.ttf") format("truetype")
}

.question {
  padding: 24px;
}

.question__body {
  margin-bottom: 16px;

  color: #FFFFFF;
  font-family: 'Pixel', sans-serif;
  font-size: 2em;
  text-align: center;
  text-shadow: 1px 3px 0px #000000;
}

.question__option-container {
  display: flex;
  justify-content: center;
}

.question__option {
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

.question__option:hover,
.question__option:focus {
    background: #AAB6FE;
}

.question__option:focus {
    outline: 1px solid #FFFFFF;
    outline-offset: -4px;
}

.question__option:active {
    transform: scale(0.95);
}

@media (min-width: 480px) {
  .question__option {
    margin: 24px;
    padding: 16px 32px;
  }
}
</style>
