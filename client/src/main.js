import Vue from 'vue'
import App from './App.vue'
import VueResource from 'vue-resource'

console.log('vue started!');

var x = Vue.use(VueResource);
console.log(x);

var vue = new Vue({
  el: '#app',
  render: h => h(App)
});

console.log(vue);


Vue.http.options.emulateJSON = true;