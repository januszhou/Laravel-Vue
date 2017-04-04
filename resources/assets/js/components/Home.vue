<template>
    <div class="row">
        <div class="col-md-12">
            <div class="center-block text-danger text-center" v-if="!user">
                <strong>You have to login to answer questions</strong>
            </div>
            <button v-if="user" class="btn btn-success btn-lg center-block" v-on:click="getQuestions">Get Start</button>

            <div v-if="questions.length > 0">
                <ol>
                    <li v-for="question in questions">
                        <label>{{question.name}}</label>
                        <select class="form-control" v-model="selectAnswers[question.id]"  v-bind:multiple="question.multiple?true:false">
                            <option val="0" v-if="question.mutiple == 0">--SELECT--</option>
                            <option v-for="answer in question.answers" v-bind:value="answer.id">{{answer.name}}</option>
                        </select>
                    </li>
                </ol>
                <div class="col-sm-12 text-center"><button class="btn btn-info btn-lg" v-on:click="submit">Submit</button></div>
            </div>
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
              error: null,
              selectAnswers: {}
          }
      },
      methods:{
          getQuestions(event){
              axios.get('/api/v1/questions')
              .then((response) => {
                let qArray = [];
                response.data.forEach((item) => {
                    this.selectAnswers[item.id] = [];
                    let question = new Question(item.id, item.title, item.is_multiple);
                    item.answers.forEach((answer) => {
                        question.addAnswers((new Answer(answer.id, answer.title)));
                    });
                    qArray.push(question);
                });

                this.questions = qArray;
              })
              .catch((error) => {
                  this.error = error;
              });
          },
          submit(even){
              console.log(this.selectAnswers);
              let answers = this.selectAnswers;
              let requestData = [];
              for(let questionId in answers){
                  let answer = answers[questionId];
                  if(!answer || answer.length === 0){
                      alert('All questions must be answered');
                      return;
                  }
                  if(Array.isArray(answer)){
                      // loop get answers
                      for(let i in answer){
                          requestData.push({question_id: questionId, answer_id: answer[i]});
                      }
                  } else {
                      requestData.push({question_id: questionId, answer_id: answer});
                  }
              }

              console.log(requestData);

              axios.post('/api/v1/user_answers', {data: requestData})
                .then((response) => {
                    console.log(response);
                    alert('Thanks for answering questions.');
                })
                .catch((error) => {
                    alert('Please try again.');
                    console.log(error);
                })
          }
      },
      computed: {
          user(){
              return this.$store.state.user;
          }
      }
    }
</script>
