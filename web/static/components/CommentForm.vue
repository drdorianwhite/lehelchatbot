<template>
	<div class="comment-box" id="comment">
        <div class="loader" v-show="loading" >
          <span class="spinner"></span>  
        </div>
        
        <form action="" method="post" @submit.prevent="submit">
          <textarea v-model="data.message" class="input-message" name="message" id="message" rows="3" placeholder="Your comment..." required></textarea>
          <input v-model="data.name" class="input-name" type="text" name="name" placeholder="Your Name" required>
          <input :disabled="loading" type="submit" value="Comment">
        </form>
    </div>
</template>

<script>
export default {

    data() {
      return {
        loading: false,
        data: {}
      }
    },

    methods: {
      submit() {
        this.loading = true;

        // Save Comment
        this.$http.post('http://localhost:3434', this.data).then((response) => {
          // success callback

          // fire event for comment
          this.$emit('commented', response.data);  

          // Clear the message
          this.data.message = "";

          this.loading = false;
        }, (response) => {
          // error callback
          this.loading = false;
        });
      }
    }

}
</script>