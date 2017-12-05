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
import Vue from 'vue'
import App from '../components/App.vue'

import VueResource from 'vue-resource'
import VueRouter from 'vue-router'
import { router } from './router'

Vue.use(VueRouter)

Vue.use(VueResource)





var vue = new Vue({
  el: '#app',
  router,
  render: h => h(App)
});

Vue.http.options.emulateJSON = true;
