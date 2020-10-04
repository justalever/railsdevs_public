<template>
  <div>
    <label for="company-description" class="label">Company description</label>
    <span class="required"></span>
    <VueTrix
      v-model="job.companyDescription"
      placeholder="Tell us about your company"
      localStorage
    />
  </div>
</template>

<script>
import VueTrix from "vue-trix";
export default {
  components: {
    VueTrix,
  },
  props: {
    job: {
      type: Object,
      required: true,
    },
  },
};
</script>
