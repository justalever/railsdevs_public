<template>
  <div>
    <label for="apply-link" class="inline-block label">Apply link</label>
    <span class="required"></span>
    <input
      type="text"
      id="apply-link"
      class="input"
      required
      v-model.trim="linkToApply"
      @input="handleLinkToApplyInput($event.target.value)"
    />
    <div v-if="$v.linkToApply.$error" class="text-sm text-red-500">
      A URL is required
    </div>
    <div class="text-sm text-red-500" v-if="!$v.linkToApply.url">
      A valid URL is required
    </div>
  </div>
</template>

<script>
import { required, url } from "vuelidate/lib/validators"

export default {
  data() {
    return {
      linkToApply: this.$store.form.job.linkToApply
    }
  },
  validations: {
    linkToApply: {
      required,
      url
    }
  },
  methods: {
    handleLinkToApplyInput(value) {
      this.$actions.updateForm('linkToApply', value)
      // this.setLink(value)
    },

    setLink(value) {
      this.$v.linkToApply.$touch()
    },
  }
}
</script>
