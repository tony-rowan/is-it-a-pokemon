<template>
  <div>
    <p>{{ pokemon.name | displayName }}</p>
    <button
      @click="submitAnswer(false)"
    >
      No
    </button>
    <button
      @click="submitAnswer(true)"
    >
      Yes
    </button>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: {
    pokemon: {
      type: Object,
      required: true
    }
  },
  filters: {
    displayName: function(name) {
      return name.charAt(0).toUpperCase() + name.slice(1)
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
p {
  font-size: 2em;
  text-align: center;
}
button {
  font-size: 1.2em;
  text-align: center;
}
</style>
