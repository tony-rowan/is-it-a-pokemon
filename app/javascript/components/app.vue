<template>
  <div id="app" class="app">
    <h1 class="app__title">Is It a Pokemon?</h1>
    <template v-if="response">
      <response
        class="app__state"
        :correct="response.correct"
        @play-again="fetchPokemon"
      />
    </template>
    <template v-else-if="pokemon">
      <question
        class="app__state"
        :pokemon="pokemon"
        @answer="markAnswer"
      />
    </template>
    <template v-else-if="error">
      <div class="app__state">
        <p class="app__error-message">Error Displaying Pokemon</p>
        <p class="app__error-message">{{ error }}</p>
      </div>
    </template>
    <template v-else>
      <loading class="app_state" />
    </template>
  </div>
</template>

<script>
import axios from 'axios'

import Question from './question'
import Response from './response'
import Loading from './loading'

export default {
  components: {
    Question,
    Response,
    Loading
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

* {
  margin: 0;
  padding: 0;
}

html, body {
  height: 100%;
}

body {
  background-color: #4FC3F7;
  background-image: radial-gradient(circle at bottom right, #4FC3F7, #0093C4);
}

.app {
  display: flex;
  align-items: center;
  align-content: center;
  justify-content: center;
  flex-flow: column nowrap;

  width: 100%;
  height: 100%;
}

.app__title {
  color: #FFFFFF;
  font-family: 'Pixel', sans-serif;
  font-size: 3em;
  text-align: center;
  text-shadow: 1px 4px 0px #000000;
}

.app__state {
  min-height: 164px;
}

.app__error-message {
  color: #FFFFFF;
  font-family: 'Pixel', sans-serif;
  font-size: 1.2em;
  text-align: center;
  text-shadow: 1px 2px 0px #000000;
}
</style>
