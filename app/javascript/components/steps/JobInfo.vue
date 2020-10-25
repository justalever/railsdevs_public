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
    <div class="grid grid-cols-1 gap-6 mb-6 lg:grid-cols-2">
      <job-experience :job="job" class="lg:col-span-1"></job-experience>
      <job-remote :job="job" class="lg:col-span-1"></job-remote>
    </div>
    <div class="grid grid-cols-1 gap-6 mb-10 lg:grid-cols-2">
      <compensation-type :job="job" class="lg:col-span-1"></compensation-type>
      <estimated-hours
        v-if="jobType == 'Contract'"
        class="lg:col-span-1"
      ></estimated-hours>
      <compensation-range
        v-if="jobType == 'Full-time'"
        class="lg:col-span-1"
      ></compensation-range>
    </div>

    <h3 class="mb-3 text-3xl font-black">About the company</h3>

    <div class="grid grid-cols-1 gap-6 mb-10 lg:grid-cols-2">
      <div class="lg:col-span-1">
        <p class="block w-full label">Company logo</p>
        <file-select v-model="job.companyLogo"></file-select>
        <p class="my-1 text-sm text-gray-500">
          While not required, we recommend adding a company logo to help your
          listing stand out.
        </p>
      </div>
      <company-website :job="job" class="lg:col-span-1"></company-website>
    </div>

    <div class="grid grid-cols-1 gap-6 mb-6 lg:grid-cols-2">
      <company-name :job="job" class="lg:col-span-1"></company-name>
      <company-email :job="job" class="lg:col-span-1"></company-email>
    </div>
    <company-description :job="job" class="mb-6"></company-description>

    <a @click="next()" class="btn btn-red btn-lg">Continue</a>
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
import CompanyName from "../fields/CompanyName";
import CompanyEmail from "../fields/CompanyEmail";
import CompanyWebsite from "../fields/CompanyWebsite";
import CompanyDescription from "../fields/CompanyDescription";
import FileSelect from "../fields/FileSelect";

export default {
  components: {
    ApplyLink,
    CompensationType,
    CompensationRange,
    CompanyName,
    CompanyEmail,
    CompanyWebsite,
    CompanyDescription,
    JobTitle,
    JobDescription,
    JobExperience,
    JobRemote,
    EstimatedHours,
    FileSelect,
  },
  methods: {
    next() {
      this.$emit("nextStep");
    },
  },
};
</script>
