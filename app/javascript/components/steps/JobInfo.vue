<template>
  <div>
    <h3 class="mb-3 text-3xl font-black">About the job</h3>
    <div class="inline-flex mb-6">
      <p class="m-0 text-xs tracking-wide text-gray-600 uppercase">
        Required fields
      </p>
      <span class="mt-2 ml-1 required"></span>
    </div>

    <job-title :job="job" class="mb-6"></job-title>
    <apply-link :job="job" class="mb-6"></apply-link>
    <job-description :job="job" class="mb-6"></job-description>
    <job-experience :job="job" class="mb-6"></job-experience>
    <compensation-type :job="job" class="mb-6"></compensation-type>
    <compensation-range :job="job" class="mb-6"></compensation-range>
    <estimated-hours :job="job" class="mb-6"></estimated-hours>
    <job-remote :job="job" class="mb-6"></job-remote>

    <h3 class="mb-3 text-3xl font-black">About the company</h3>

    <a @click="next()" class="btn btn-default">Next</a>
  </div>
</template>

<script>
import ApplyLink from "../fields/ApplyLink";
import JobTitle from "../fields/JobTitle";
import JobDescription from "../fields/JobDescription";
import JobExperience from "../fields/JobExperience";
import CompensationType from "../fields/CompensationType";
import CompensationRange from "../fields/CompensationRange";
import EstimatedHours from "../fields/EstimatedHours";
import JobRemote from "../fields/JobRemote";

export default {
  components: {
    ApplyLink,
    CompensationType,
    CompensationRange,
    JobTitle,
    JobDescription,
    JobExperience,
    JobRemote,
    EstimatedHours,
  },
  props: {
    job: {
      type: Object,
      required: true,
    },
  },
  methods: {
    next() {
      this.$emit("nextStep");
    },
  },
};
</script>
