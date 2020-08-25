<template>
  <div id="app">
    <h1>Is It a Pokemon?</h1>
    <p>{{ pokemon ? pokemon.name : '...' }}</p>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function() {
    return {
      pokemon: null
    }
  },
  created: async function() {
    let response = await axios.get('/pokemon')
    this.pokemon = response.data
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
