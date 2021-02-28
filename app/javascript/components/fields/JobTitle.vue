<template>
  <div>
    <label for="title" class="label">Title</label>
    <span class="required"></span>
    <input
      type="text"
      id="title"
      @input="handleTitleInput($event.target.value)"
      v-model.trim="title"
      placeholder="Enter a job title"
      class="input"
      required
    />

    <div v-if="$v.title.$error" class="text-sm text-red-500">
      A title is required
    </div>
    <div v-if="!$v.title.minLength" class="text-sm text-red-500">
      Title must have at least {{ $v.title.$params.minLength.min }} letters.
    </div>
  </div>
</template>

<script>
import { required, minLength } from "vuelidate/lib/validators"

export default {
  data() {
    return {
      title: this.$store.form.job.title
    }
  },
  validations: {
    title: {
      required,
      minLength: minLength(4),
    },
  },
  methods: {
    handleTitleInput(value) {
      this.$actions.updateForm('title', value)
    },
  },
  computed: {
    titleMin() {
      return this.$v.title.minLength.min
    }

  }
}
</script>
