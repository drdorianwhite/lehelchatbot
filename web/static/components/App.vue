
<template>
<div>
 <router-view></router-view >
 <comment-box></comment-box>
 </div>
</template>

<script>

import auth from '../js/auth/'
import CommentBox from './CommentBox.vue'

export default {
    data () {
      return {
        comments: [],
        loading: false,
        user: {},
        test: "hello"
      }
    },

    components: {
      CommentBox
    },

    beforeCreate(){
      auth.currentUser(this)
    },

    created () {
    },

    methods: {

    }

}
</script>
