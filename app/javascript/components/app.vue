<template>
  <div id="app">
    <h1>Is It a Pokemon?</h1>
    <div v-if="answer != null">
      <h2>{{ answer ? 'Correct!' : 'Wrong!' }}</h2>
      <button
        @click="fetchPokemon"
      >
        Play Again?
      </button>
    </div>
    <div v-else-if="pokemon">
      <p>{{ pokemon.name | displayName }}</p>
      <button
        @click="markAnswer(false)"
      >
        No
      </button>
      <button
        @click="markAnswer(true)"
      >
        Yes
      </button>
    </div>
    <div v-else-if="error">
      <p>Error Displaying Pokemon</p>
      <p>{{ error }}</p>
    </div>
    <div v-else>
        <p>...</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function() {
    return {
      answer: null,
      error: null,
      pokemon: null,
    }
  },
  filters: {
    displayName: function(name) {
      return name.charAt(0).toUpperCase() + name.slice(1)
    }
  },
  created: async function() {
    this.fetchPokemon()
  },
  methods: {
    fetchPokemon: async function() {
      this.pokemon = null
      this.error = null
      this.answer = null

      try {
        let response = await axios.get('/pokemon')
        this.pokemon = response.data
      } catch(e) {
        this.error = e
      }
    },
    markAnswer: function(real) {
      this.answer = this.pokemon.real === real
    }
  }
}
</script>

<style>
h1 {
  font-size: 3em;
  text-align: center;
}

p {
  font-size: 2em;
  text-align: center;
}
</style>
