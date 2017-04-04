<template>
    <div class="row">
        <div class="col-md-12">
            <div class="center-block text-danger text-center" v-if="!user">
                <strong>You have to login to answer questions</strong>
            </div>
            <button v-if="user" class="btn btn-success btn-lg center-block" v-on:click="getQuestions">Get Start</button>

            <ol>
                <li v-for="question in questions">
                    <label>{{question.name}}</label>
                    <select class="form-control"  v-bind:multiple="question.multiple?true:false">
                        <option val="0" v-if="question.mutiple === 0">--SELECT--</option>
                        <option v-for="answer in question.answers" v-bind:val="answer.id">{{answer.name}}</option>
                    </select>
                </li>
            </ol>
        </div>
    </div>
</template>

<script>
    class Question {
      constructor(id, name, multiple = 0) {
        this.id = id;
        this.name = name;
        this.multiple = multiple;
        this.answers = [];
      }

      addAnswers(answer){
        this.answers.push(answer);
      }
    }

    class Answer {
      constructor(id, name) {
        this.id = id;
        this.name = name;
      }
    }

    export default {
      data(){
          return {
              questions: [],
              start: false,
              error: null
          }
      },
      methods:{
          getQuestions(event){
              axios.get('/api/v1/questions')
              .then((response) => {
                let qArray = [];
                response.data.forEach((item) => {
                    let question = new Question(item.id, item.title, item.is_multiple);
                    item.answers.forEach((answer) => {
                        question.addAnswers((new Answer(answer.id, answer.title)));
                    });
                    qArray.push(question);
                });

                this.questions = qArray;
              })
              .catch((error) => {
                  console.log(error);
                  this.error = error.response.data.detail;
              });
          }
      },
      computed: {
          user(){
              return this.$store.state.user;
          }
      }
    }
</script>
