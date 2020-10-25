<template>
  <div>
    <label for="estimated-hours" class="label">Estimated hours</label>
    <span class="required"></span>
    <div class="relative">
      <select
        id="estimated-hours"
        class="select"
        @change="$actions.updateForm('estimatedHours', $event.target.value)"
      >
        <option
          value="less than 10"
          :selected="$store.form.job.estimatedHours === 'less than 10'"
        >
          less than 10
        </option>
        <option
          value="10-30"
          :selected="$store.form.job.estimatedHours === '10-30'"
        >
          10-30
        </option>
        <option
          value="30-60"
          :selected="$store.form.job.estimatedHours === '30-60'"
        >
          30-60
        </option>
        <option
          value="60-90"
          :selected="$store.form.job.estimatedHours === '60-90'"
        >
          60-90
        </option>
        <option
          value="more than 100"
          :selected="$store.form.job.estimatedHours === 'more than 100'"
        >
          more than 100
        </option>
      </select>
      <select-arrow></select-arrow>
    </div>
  </div>
</template>

<script>
import SelectArrow from "../icons/SelectArrow";

export default {
  components: {
    SelectArrow,
  },
};
</script>
