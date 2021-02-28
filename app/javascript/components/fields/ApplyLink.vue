<template>
  <div>
    <label for="apply-link" class="inline-block label">Apply link</label>
    <span class="required"></span>
    <input
      type="text"
      id="apply-link"
      class="input"
      required
      :value="$store.form.job.linkToApply"
      @change="$actions.updateForm('linkToApply', $event.target.value)"
    />
    <!-- <div class="text-sm text-red-500" v-if="hasErrors">A URL is required</div>
    <div class="text-sm text-red-500" v-if="!validUrl">
      A valid URL is required
    </div> -->
  </div>
</template>

<script>
export default {
  computed: {

  },

  mounted() {
  }
}
</script>
