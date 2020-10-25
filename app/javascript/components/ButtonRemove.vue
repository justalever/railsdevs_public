<template>
  <button
    class="absolute top-0 right-0 flex items-center justify-center w-6 h-6 mt-2 mr-2 bg-red-500 rounded-full hover:bg-red-600"
    @click.prevent="handleButtonRemoveClick($event.target)"
  >
    <svg
      class="w-4 h-4 text-white fill-current"
      xmlns="http://www.w3.org/2000/svg"
      width="20"
      height="20"
      viewBox="0 0 20 20"
    >
      <title>close</title>
      <g>
        <path
          d="M10 8.586L2.929 1.515 1.515 2.929 8.586 10l-7.071 7.071 1.414 1.414L10 11.414l7.071 7.071 1.414-1.414L11.414 10l7.071-7.071-1.414-1.414L10 8.586z"
        ></path>
      </g>
    </svg>
  </button>
</template>

<script>
export default {
  methods: {
    handleButtonRemoveClick(target) {
      this.$emit("buttonRemoveClicked", target);
    },
  },
};
</script>
