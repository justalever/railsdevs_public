<template>
  <div
    class="fixed bottom-0 left-0 right-0 flex items-center w-full py-3 bg-black border-t bg-opacity-95 lg:px-8"
    :class="position"
  >
    <slot></slot>
  </div>
</template>

<script>
export default {
  props: {
    position: {
      required: true,
      type: String,
    },
  },
};
</script>
