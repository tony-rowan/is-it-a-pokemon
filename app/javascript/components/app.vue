<template>
  <div id="app">
    <h1>Is It a Pokemon?</h1>
    <p>{{ pokemon }}</p>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      pokemon: "Hello Vue!"
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
