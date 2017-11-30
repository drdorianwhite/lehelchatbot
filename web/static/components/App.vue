
<template>
  <div id="app">
    <div class="brand">
        <div class="great-question">
          <h3>{{ question }}<span>?</span></h3>
          <a href="#comment" class="btn-primary">Comment</a>
        </div>

        <div class="comment-list">
        <span v-show="loading" class="spinner"></span>
          <ul>
              <comment v-for="comment in comments" :comment="comment" :key="comment.id"></comment>
          </ul>
        </div>

        <comment-form v-on:commented="updateComment"></comment-form>
    </div>
  </div>
</template>

<script>

import Comment from './Comment.vue'
import CommentForm from './CommentForm.vue'

export default {

    data () {
      return {
        question: 'What you think about Vue.js',
        comments: [],
        loading: false
      }
    },

    components: {
      Comment,
      CommentForm
    },

    created () {
        console.log("creating app component");
        this.loading = true;

        // Fetch the comments 
        this.$http.get('http://localhost:4001/api/v1/comments').then((response) => {
            // success callback
            this.comments = response.data;
            this.loading = false;
        }, (response) => {
            // error callback
            console.error(response);
            this.loading = false;
        });
    },

    methods: {
      updateComment (comment) {
        this.comments.push(comment);
      } 
    }

}
</script>
