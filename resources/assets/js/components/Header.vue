<template>
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <router-link to="/" class="navbar-brand">Ableto</router-link>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right" v-if="!userName">
                    <li><router-link to="/login" >Login</router-link></li>
                    <li><router-link to="/register">Register</router-link></li>
                </ul>

                <ul class="nav navbar-nav navbar-right" v-if="userName">
                    <li class="dropdown" v-if="userName">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            {{userName}} <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#" v-on:click.prevent="logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
    export default {
      data(){
          return {
          }
      },
      methods:{
          logout(event){
              // logout will delete authentication cookie and redirect to login page
              this.$cookie.delete('authentication');
              this.$router.push({ path: '/login' });
          }
      },
      computed: {
          userName(){
              return this.$store.getters.name;
          }
      }
    }
</script>
