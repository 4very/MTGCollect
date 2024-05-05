<script setup>
import {
 // PaginationEllipsis,
 // PaginationFirst,
  //PaginationLast,
  //PaginationList,
  //PaginationListItem,
  PaginationNext,
 // PaginationPrev,
  //PaginationRoot,
} from 'radix-vue'
import {Card} from '../components/card.vue'
import {Pagination} from '../components/Pagination.vue'

const next = PaginationNext(['click'])
console.log (next.click)
</script>

<template>
  <div class="font-body">Hello! i am index.vue<Pagination></Pagination></div>
</template>
