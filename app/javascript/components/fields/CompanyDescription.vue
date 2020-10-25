<template>
  <div>
    <label for="company-description" class="label">Company description</label>
    <span class="required"></span>
    <VueTrix
      v-model="$store.form.job.companyDescription"
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
  method: {
    // handleFileAcceptEvent(event) {
    //   event.preventDefault();
    //   alert("File attachments are not supported");
    // },
  },
};
</script>
