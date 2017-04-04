<template>
    <div class="row">
        <div class="col-md-12">
            <div class="center-block text-danger text-center" v-if="!user">
                <strong>You have to login to answer questions</strong>
            </div>
            <button v-if="user" class="btn btn-success btn-lg center-block" v-on:click="getQuestions">Get Start</button>
        </div>
    </div>
</template>

<script>
    export default {
      data(){
          return {
              questions: null,
              start: false,
              error: null
          }
      },
      methods:{
          getQuestions(event){
              axios.get('/api/v1/questions')
              .then((response) => {
                  console.log(response);
              })
              .catch((error) => {
                  this.error = error.response.data.detail;
              });
          }
      },
      computed: {
          user(){
              console.log(this.$store.state.user);
              return this.$store.state.user;
          }
      }
    }
</script>
