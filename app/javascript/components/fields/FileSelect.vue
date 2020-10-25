<template>
  <div class="relative inline-block">
    <img
      class="object-cover rounded-full"
      :src="companyImage"
      :class="{ 'mt-2 w-32 h-32': !!companyImage }"
    />
    <div v-if="error" class="mb-1 text-sm text-red-500">{{ error }}</div>
    <div v-if="!companyImage">
      <label class="file-select">
        <div class="inline-block select-button btn btn-default">
          <span>Select file</span>
        </div>

        <input type="file" @change="handleFileChange" name="companyLogo" />
      </label>
    </div>
    <button-remove v-else @buttonRemoveClicked="removeImage"></button-remove>
  </div>
</template>

<script>
import ButtonRemove from "../ButtonRemove";
export default {
  components: {
    ButtonRemove,
  },
  data() {
    return {
      companyImage: "",
      error: "",
    };
  },

  methods: {
    handleFileChange(e) {
      this.$emit("input", e.target.files[0]);

      let files = e.target.files || e.dataTransfer.files;
      let imageTypes = ["image/gif", "image/png", "image/jpeg", "image/jpg"];

      if (!files.length) {
        return;
      }

      if (files[0].size > 200000) {
        this.error = "Please choose a file smaller in size";
        return;
      }

      if (!imageTypes.includes(files[0].type)) {
        this.error = "Please try a different image format";
        return;
      }

      this.createImage(files[0]);
    },
    createImage(file) {
      const reader = new FileReader();
      const vm = this;

      reader.onload = (e) => {
        vm.companyImage = e.target.result;
        localStorage.setItem("logoImage", JSON.stringify(vm.companyImage));
      };

      reader.readAsDataURL(file);
    },
    removeImage() {
      this.companyImage = "";
      if (localStorage.getItem("logoImage")) {
        localStorage.removeItem("logoImage");
      }
    },
  },
  created() {
    if (localStorage.getItem("logoImage")) {
      this.companyImage = JSON.parse(localStorage.getItem("logoImage"));
    }
  },
};
</script>

<style lang="scss" scoped>
.file-select input[type="file"] {
  display: none;
}
</style>
