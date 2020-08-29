<template>
  <div id="app">
    <h1>Is It a Pokemon?</h1>
    <p v-if="loading">...</p>
    <p v-if="pokemon">{{ pokemon.name }}</p>
    <p v-if="error">
      <span>Error Displaying Pokemon</span>
      <span>{{ error }}</span>
    </p>
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
  created: async function() {
    try {
      let response = await axios.get('/pokemon')
      this.pokemon = response.data
    } catch(e) {
      this.error = e;
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
