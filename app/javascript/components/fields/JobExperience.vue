<template>
  <div>
    <label for="job-experience" class="label">Years of experience</label>
    <span class="required"></span>
    <div class="relative">
      <select
        id="job-experience"
        class="select"
        @change="$actions.updateForm('yearsOfExperience', $event.target.value)"
      >
        <option value="1" :selected="$store.form.job.yearsOfExperience === '1'">
          1
        </option>
        <option value="2" :selected="$store.form.job.yearsOfExperience === '2'">
          2
        </option>
        <option value="3" :selected="$store.form.job.yearsOfExperience === '3'">
          3
        </option>
        <option value="4" :selected="$store.form.job.yearsOfExperience === '4'">
          4
        </option>
        <option value="5" :selected="$store.form.job.yearsOfExperience === '5'">
          5
        </option>
        <option value="6" :selected="$store.form.job.yearsOfExperience === '6'">
          6
        </option>
        <option value="7" :selected="$store.form.job.yearsOfExperience === '7'">
          7
        </option>
        <option value="8" :selected="$store.form.job.yearsOfExperience === '8'">
          8
        </option>
        <option value="9" :selected="$store.form.job.yearsOfExperience === '9'">
          9
        </option>
        <option
          value="10"
          :selected="$store.form.job.yearsOfExperience === '10'"
        >
          10
        </option>
        <option
          value="more than 10"
          :selected="$store.form.job.yearsOfExperience === 'more than 10'"
        >
          more than 10
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
