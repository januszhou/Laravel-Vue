<template>
    <div class="row">
        <div class="col-md-12">
            <div class="center-block text-danger text-center" v-if="!user">
                <strong>You have to login to answer questions</strong>
            </div>
            <button v-if="user && !admin" class="btn btn-success btn-lg center-block" v-on:click="getQuestions">Get Start</button>

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
            <!-- Admin view -->
            <div v-if="user && admin">
              <div class="col-sm-12 text-center"><button class="btn btn-info btn-lg" v-on:click="getCharts">Get Charts</button></div>
              <div class="row" v-if="chartData">
                <div class="col-md-4" v-for="questionData in chartData.questions">
                  <bar-chart :data="questionData" :option="{}" />
                </div>
                <div class="col-md-4">
                  <bar-chart :data="chartData.unique" :option="{}" />
                </div>
                <div class="col-md-4">
                  <bar-chart :data="chartData.answers" :option="{}" />
                </div>
              </div>
            </div>
        </div>
    </div>
</template>

<script>
    import BarChart from './BarChart.js'
    // TODO: Put into model class later if needed
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
              selectAnswers: {},
              chartData: null
          }
      },
      components: { BarChart },
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

            axios.post('/api/v1/user_answers', {data: requestData})
              .then((response) => {
                  console.log(response);
                  alert('Thanks for answering questions.');
              })
              .catch((error) => {
                  alert('Please try again.');
              });
          },
          getCharts(event){
            axios.get('/api/v1/charts')
              .then((response) => {
                /**
                {
                  labels: ['Very Well', 'Fair', 'Bad'],
                  datasets: [
                    {
                      label: 'How do you feel',
                      backgroundColor: '#f87979',
                      data: [1, 2, 1]
                    }
                  ]
                }
                **/
                this.chartData = {};
                this.chartData.questions = [
                  {
                    labels: ['Very Well', 'Well', 'Fair', 'Bad'],
                    datasets: [
                      {
                        label: 'How do you feel',
                        backgroundColor: '#f87979',
                        data: [0, 0, 0, 0, 0]
                      }
                    ]
                  },
                  {
                    labels: ['Egg', 'Pancake', 'Coffee', 'Bread'],
                    datasets: [
                      {
                        label: 'What you had for breakfast',
                        backgroundColor: '#4285F4',
                        data: [0, 0, 0, 0]
                      }
                    ]
                  },
                  {
                    labels: ['One day', 'Two days', 'Three days', 'Four days', 'Five days', 'More days'],
                    datasets: [
                      {
                        label: 'How many days do you work per week',
                        backgroundColor: '#aa66cc',
                        data: [0, 0, 0, 0, 0, 0]
                      }
                    ]
                  },
                ];
                this.chartData.unique = {
                  labels: [], // past 5 days
                  datasets: [
                    {
                      label: 'Unique user answer questions',
                      backgroundColor: '#3E4551',
                      data: [0, 0, 0, 0, 0] // 5 days data
                    }
                  ]
                };

                this.chartData.answers = {
                  labels: [], // past 5 days
                  datasets: [
                    {
                      label: 'User answered questions',
                      backgroundColor: '#00695c',
                      data: [0, 0, 0, 0, 0] // 5 days data
                    }
                  ]
                };

                /**
                Initial 5 past days
                **/
                for(let i = 0; i <= 4; i++){
                  let date = new Date();
                  date.setDate(date.getDate() - i);
                  this.chartData.answers.labels.push(date.toISOString().substring(0, 10));
                  this.chartData.unique.labels.push(date.toISOString().substring(0, 10));
                }

                let chartData = response.data;
                let questions = chartData.by_question;
                let formatQuestionData = (questions, destination) => {
                  if(questions && questions.length > 0){
                    let questionDataFormat = {};
                    questions.forEach((element) => {
                      let key = element.question.toLowerCase();
                      let key2 = element.answer.toLowerCase();
                      if(questionDataFormat.hasOwnProperty(key)){
                        questionDataFormat[key][key2] = element.times;
                      } else {
                        questionDataFormat[key] = {};
                        questionDataFormat[key][key2] = element.times;
                      }
                    });

                    destination.forEach((element) => {
                      let question = element.datasets[0].label;
                      question = question.toLowerCase();
                      if(questionDataFormat.hasOwnProperty(question)){
                        for(let i = element.labels.length - 1; i >= 0; i--){
                          let item = element.labels[i].toLowerCase();
                          if(questionDataFormat[question].hasOwnProperty(item)){
                            element.datasets[0].data[i] = questionDataFormat[question][item];
                          }
                        }
                      }
                    });
                  }
                }

                let formatDateData = (questions, destination) => {
                  if(questions && questions.length > 0){
                    let questionDataFormat = {};
                    questions.forEach((element) => {
                      let key = element.date.toLowerCase();
                      questionDataFormat[key] = element.times;
                    });
                    console.log(questionDataFormat);

                    for(let i = destination.labels.length - 1; i >= 0; i--){
                      let item = destination.labels[i].toLowerCase();
                      if(questionDataFormat.hasOwnProperty(item)){
                        destination.datasets[0].data[i] = questionDataFormat[item];
                      }
                    }
                  }
                }



                formatQuestionData(questions, this.chartData.questions);
                formatDateData(chartData.unique_user, this.chartData.unique);
                formatDateData(chartData.by_answers, this.chartData.answers);
              })
              .catch((error) => {
                  console.log(error);
                  alert('Please try again.');
              });
          }
      },
      computed: {
          user(){
              return this.$store.state.user;
          },
          admin(){
              return this.$store.state.user.admin == 1;
          }
      }
    }
</script>
