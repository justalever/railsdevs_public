<template>
  <div>
    <label for="title" class="label">Title</label>
    <span class="required"></span>
    <input
      type="text"
      id="title"
      @input="$actions.updateForm('title', $event.target.value)"
      v-model="$store.form.job.title"
      placeholder="Enter a job title"
      class="input"
      required
    />
  </div>
</template>
