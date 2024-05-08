<script setup>
import Card from '../components/card.vue'
import Pagination from '../components/Pagination.vue'
import {ref} from 'vue'
// we need this script to receive the signal Pagination.vue emits when the user clicks the next page button 

// const next = ref('You have clicked the next button')   <--just for debugging purposes, in theory, if the signal is Emitted from pagination when the 'Next page' arrow key is pressed, it'll tell the child script ( index.vue) to do something
</script>

<template>
  <div class="font-body">Hello! i am index.vue
    <Pagination v-on:nextClick=  ></Pagination></div>
</template>
