<template>
    <div class="navbar">
    <nav class="navbar navbar-toggleable-md navbar-light bg-success navbar-inverse">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#">Navbar</a>

        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item" v-for="route in routes" :key="route.title">
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
      return { checked: false, title: 'Check me' }
    },
    methods: {
      check() { this.checked = !this.checked; }
    }
  }
</script>