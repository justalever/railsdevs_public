<template>
  <div>
    <h3 class="mb-3 text-3xl font-black">About the job</h3>
    <div class="inline-flex mb-6">
      <p class="m-0 text-xs tracking-wide text-gray-600 uppercase">
        Required fields
      </p>
      <span class="mt-2 ml-1 required"></span>
    </div>

    <job-title class="mb-6"></job-title>
    <apply-link class="mb-6"></apply-link>
    <job-description class="mb-6"></job-description>
    <div class="grid grid-cols-1 gap-6 mb-6 lg:grid-cols-2">
      <job-experience class="lg:col-span-1"></job-experience>
      <job-remote class="lg:col-span-1"></job-remote>
    </div>
    <div class="grid grid-cols-1 gap-6 mb-10 lg:grid-cols-2">
      <compensation-type class="lg:col-span-1"></compensation-type>
      <estimated-hours
        v-if="$store.form.job.compensationType == 'Contract'"
        class="lg:col-span-1"
      ></estimated-hours>
      <compensation-range
        v-if="$store.form.job.compensationType == 'Full-time'"
        class="lg:col-span-1"
      ></compensation-range>
    </div>

    <h3 class="mb-3 text-3xl font-black">About the company</h3>

    <div class="grid grid-cols-1 gap-6 mb-10 lg:grid-cols-2">
      <div class="lg:col-span-1">
        <p class="block w-full label">Company logo</p>
        <file-select v-model="$store.form.job.companyLogo"></file-select>
        <p class="my-1 text-sm text-gray-500">
          While not required, we recommend adding a company logo to help your
          listing stand out.
        </p>
      </div>
      <company-website class="lg:col-span-1"></company-website>
    </div>

    <div class="grid grid-cols-1 gap-6 mb-6 lg:grid-cols-2">
      <company-name class="lg:col-span-1"></company-name>
      <company-email class="lg:col-span-1"></company-email>
    </div>
    <company-description class="mb-6"></company-description>

    <form-pagination position="justify-end">
      <a @click="next()" class="btn btn-white btn-outline btn-lg">Continue</a>
    </form-pagination>
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
import FormPagination from "../FormPagination";

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
    FormPagination,
  },
  methods: {
    next() {
      this.$emit("nextStep");
    },
  },
  created() {
    const storedForm = this.$actions.openStorage();

    if (storedForm) {
      this.$store.form.job.title = storedForm.title;
      this.$store.form.job.companyName = storedForm.companyName;
      this.$store.form.job.companyWebsite = storedForm.companyWebsite;
      this.$store.form.job.companyLogo = storedForm.companyLogo;
      this.$store.form.job.companyDescription = storedForm.companyDescription;
      this.$store.form.job.email = storedForm.email;
      this.$store.form.job.compensationRange = storedForm.compensationRange;
      this.$store.form.job.compensationType = storedForm.compensationType;
      this.$store.form.job.description = storedForm.description;
      this.$store.form.job.estimatedHours = storedForm.estimatedHours;
      this.$store.form.job.headquarters = storedForm.headquarters;
      this.$store.form.job.linkToApply = storedForm.linkToApply;
      this.$store.form.job.price = storedForm.price;
      this.$store.form.job.remote = storedForm.remote;
      this.$store.form.job.title = storedForm.title;
      this.$store.form.job.yearsOfExperience = storedForm.yearsOfExperience;
      this.$store.form.job.upsellType = storedForm.upsellType;
    }
  },
};
</script>
