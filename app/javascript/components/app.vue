<template>
  <div id="app">
    <h1>Is It a Pokemon?</h1>
    <div v-if="loading">
        <p>...</p>
    </div>
    <div v-if="pokemon">
      <p>{{ pokemon.name | displayName }}</p>
      <button
        @click="fetchPokemon"
      >
        No
      </button>
      <button
        @click="fetchPokemon"
      >
        Yes
      </button>
    </div>
    <div v-if="error">
      <p>Error Displaying Pokemon</p>
      <p>{{ error }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function() {
    return {
      error: null,
      pokemon: null,
    }
  },
  computed: {
    loading: function() {
      return !this.pokemon && !this.error
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

      try {
        let response = await axios.get('/pokemon')
        this.pokemon = response.data
      } catch(e) {
        this.error = e
      }
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
