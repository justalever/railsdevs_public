<template>
  <div>
    <h1 class="text-4xl font-black">Job Info</h1>

    <a @click="next()" class="btn btn-default">Next</a>
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
    next() {
      this.$emit("nextStep");
    },
  },
};
</script>
