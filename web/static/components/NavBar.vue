<template>
    <div class="navbar">
    <nav class="navbar navbar-toggleable-md navbar-light bg-success navbar-inverse">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="/site/home/">ChatBotCommentBox</a>

        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item" v-for="route in routes">
                    <router-link :to="route" class="nav-link" active-class="active">
                        {{ route.title }}
                    </router-link>
                </li>
            </ul>
        </div>
    </nav>
    </div>
</template>
<script>
export default {
    data() {
      return { name: 'nav-bar',checked: false, title: 'Check me' }
    },
    methods: {
      check() { this.checked = !this.checked; }
    },
    computed: {
        routes: function () {
            var routes = [];
            for (var i in this.$router.options.routes) {
                if (!this.$router.options.routes.hasOwnProperty(i)) {
                    continue
                }
                var route = this.$router.options.routes[i];
                if(route.hasOwnProperty('title')) {
                    routes.push(route);
                }
            }
            return routes;
        }
    }
  }
</script>