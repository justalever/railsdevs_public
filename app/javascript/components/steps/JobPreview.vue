<template>
  <div>
    <h1 class="text-4xl font-black">Preview</h1>

    <a @click.prevent="next()" class="btn btn-red btn-lg">Next</a>
    <a @click.prevent="prev()" class="btn btn-red btn-lg">Back</a>
  </div>
</template>

<script>
export default {
  methods: {
    next() {
      this.$emit("nextStep");
    },

    prev() {
      this.$emit("prevStep");
    },
  },
};
</script>
