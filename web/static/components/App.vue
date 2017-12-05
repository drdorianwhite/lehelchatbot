
<template>
<div>
<nav-bar></nav-bar>
 <router-view></router-view >
</div>
</template>

<script>

import auth from '../js/auth/'
import NavBar from './NavBar'

export default {
    data () {
      return {
        comments: [],
        loading: false,
        user: {},
      }
    },
    components: {
      'nav-bar':NavBar
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
