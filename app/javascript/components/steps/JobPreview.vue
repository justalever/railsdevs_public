<template>
  <div>
    <div class="grid gap-10 lg:grid-cols-12 grid-col-1">
      <preview-content></preview-content>
      <preview-sidebar></preview-sidebar>
    </div>

    <form-pagination position="justify-between">
      <a @click.prevent="prev()" class="btn btn-white btn-outline btn-lg"
        >Back</a
      >
      <a @click.prevent="next()" class="btn btn-white btn-outline btn-lg"
        >Next</a
      >
    </form-pagination>
  </div>
</template>

<script>
import PreviewSidebar from "../preview/PreviewSidebar";
import PreviewContent from "../preview/PreviewContent";
import FormPagination from "../FormPagination";

export default {
  components: {
    PreviewContent,
    PreviewSidebar,
    FormPagination,
  },
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
