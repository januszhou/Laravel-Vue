
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

Vue.use(VueRouter);
Vue.use(VueCookie);

const VueStore = require('vuex');
Vue.use(VueStore);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('header-nav', require('./components/Header.vue'));

const Login = Vue.component('login', require('./components/Login.vue'));
const Register = Vue.component('register', require('./components/Register.vue'));
const NotFound = Vue.component('not-found', require('./components/NotFound.vue'));
const Home = Vue.component('home', require('./components/Home.vue'));

const routes = [
    { path: '/', component: require('./components/Home.vue') },
    { path: '/login', component: require('./components/Login.vue') },
    { path: '/register', component: require('./components/Register.vue') },
    { path: '*', component: require('./components/NotFound.vue') }
];

const router = new VueRouter({ mode: 'history', routes: routes});

const store = new VueStore.Store({
  state: {
    user: null
  },
  getters: {
    name: state => {
      return state.user?state.user.first_name + ' ' + state.user.last_name:null;
    },
    user: state => {
      return state.user
    }
  },
  mutations: {
    setUser(state, user){
      state.user = user;
    }
  }
});

let auth = VueCookie.get('authorization');

try {
  auth = JSON.parse(auth);
} catch(e) {
  VueCookie.delete('authorization'); // delete error authorization
  auth = null;
}

axios.defaults.headers.common['Authorization'] = auth?auth.token:null; // set auth token

const app = new Vue({
  router: router,
  store: store,
  created: () => {
      if(auth){
        axios.get(auth.url)
        .then((response) => {
            console.log(response);
            store.commit('setUser', response.data);
        })
        .catch((error) => {
            router.push({ path: '/login' });
        });
      }
  }
}).$mount('#app');
