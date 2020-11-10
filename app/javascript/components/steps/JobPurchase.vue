<template>
  <div>
    <h1 class="text-4xl font-black">Purchase</h1>

    <form-pagination position="end">
      <a @click.prevent="prev()" class="btn btn-white btn-outline btn-lg"
        >Back</a
      >
    </form-pagination>
  </div>
</template>

<script>
import FormPagination from "../FormPagination";

export default {
  components: {
    FormPagination,
  },
  methods: {
    prev() {
      this.$emit("prevStep");
    },
  },
};
</script>
