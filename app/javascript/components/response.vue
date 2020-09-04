<template>
  <div>
    <h2>{{ title }}</h2>
    <button
      @click="$emit('play-again')"
    >
      Play Again?
    </button>
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
h2 {
  font-size: 2.4em;
  text-align: center;
}
button {
  font-size: 1.2em;
  text-align: center;
}
</style>
