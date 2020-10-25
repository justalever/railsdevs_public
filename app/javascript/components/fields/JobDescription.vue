<template>
  <div>
    <label for="job-description" class="label">Job description</label>
    <span class="required"></span>
    <VueTrix
      v-model="$store.form.job.description"
      placeholder="Enter more details about the role"
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
};
</script>
