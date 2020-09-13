<template>
  <div id="app">
    <h1>Is It a Pokemon?</h1>
    <div v-if="response">
      <response
        :correct="response.correct"
        @play-again="fetchPokemon"
      />
    </div>
    <div v-else-if="pokemon">
      <question
        :pokemon="pokemon"
        @answer="markAnswer"
      />
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

import Question from './question'
import Response from './response'

export default {
  components: {
    Question,
    Response
  },
  data: function() {
    return {
      response: null,
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
      this.response = null

      try {
        let response = await axios.get('/random')
        this.pokemon = response.data
      } catch(e) {
        this.error = e
      }
    },
    markAnswer: async function(real) {
      let params = {
        pokemon: this.pokemon.name,
        real: real
      };

      this.pokemon = null
      this.error = null
      this.response = null

      try {
        let response = await axios.post('/answer', params)
        this.response = response.data
      } catch(e) {
        this.error = e
      }
    }
  }
}
</script>

<style>
@font-face {
  font-family: "Pixel";
  src: url("../assets/fonts/pixel.ttf") format("truetype")
}

body {
  font-family: 'Pixel', sans-serif;
}

h1 {
  font-size: 3em;
  text-align: center;
}

p {
  font-size: 2em;
  text-align: center;
}
</style>
