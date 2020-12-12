<template>
  <div>
    <div class="grid gap-10 lg:grid-cols-12 grid-col-1">
      <preview-content></preview-content>
      <preview-sidebar></preview-sidebar>
    </div>

    <form-pagination position="justify-between">
      <div class="lg:flex-1">
        <a @click.prevent="prev()" class="btn btn-white btn-outline btn-lg"
          >Back</a
        >
      </div>
      <div
        v-if="$actions.formattedPrice()"
        class="mr-4 text-3xl font-black text-right text-white"
      >
        {{ $actions.formattedPrice() }}
      </div>
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
