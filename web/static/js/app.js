// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

require('./bootstrap');
import Vue from 'vue'
import App from '../components/App.vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'
import Home from '../components/CommentBox'
import Login from '../components/Login'
import Signup from '../components/Signup'
import NavBar from '../components/NavBar'
import auth from './auth'

Vue.use(VueRouter)
Vue.use(VueResource)

/*
const requireAuth = (to, _from, next) => {
  if (!auth.user.authenticated) {
    next({
      path: '/site/login/',
      query: { redirect: to.fullPath }
    })
  } else {
    next()
  }
}
*/

const afterAuth = (_to, from, next) => {
  if (auth.user.authenticated) {
    next(from.path)
  } else {
    next('/')
  }
}

// 2. Define some routes
var routes = [{
    name: 'home',
    title: 'Comments',
    path: '/site/home/',
    component: Home
}, {
    name: 'login',
    title: 'Login',
    path: '/site/login/',
    component: Login
}, {
    name: 'signup',
    path: '/site/signup/',
    component: Signup
}];

// 3. Create the router instance and pass the `routes` option
var router = new VueRouter({
    mode: 'history',
    history: true,
    base: '/',
    routes:routes // short for routes: routes
});

// 4. Create and mount the root instance.
var app = new Vue({
    router,
    render: h => h(App)
}).$mount('#app');


Vue.http.options.emulateJSON = true;
