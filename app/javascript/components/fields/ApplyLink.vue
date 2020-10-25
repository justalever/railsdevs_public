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
  </div>
</template>
