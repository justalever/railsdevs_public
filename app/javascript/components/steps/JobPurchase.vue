<template>
  <div>
    <h1 class="text-4xl font-black">Purchase</h1>

    <a @click.prevent="prev()" class="btn btn-default">Back</a>
  </div>
</template>

<script>
export default {
  props: {
    job: {
      type: Object,
      required: true,
    },
  },
  methods: {
    prev() {
      this.$emit("prevStep");
    },
  },
};
</script>
