<template>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="" v-on:submit.prevent="onSubmit">
                        <div v-if="errors">
                            <ul v-for="(error, name, index) in errors">
                                <strong>{{name}}</strong>
                                <li v-for="detail in error" class="text-danger">{{detail}}</li>
                            </ul>
                        </div>

                        <div class="form-group">
                            <label for="first-name" class="col-md-4 control-label">First Name</label>

                            <div class="col-md-6">
                                <input id="first-name" type="text" class="form-control" name="first_name" value="" required autofocus v-model="firstName">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="last-name" class="col-md-4 control-label">Last Name</label>

                            <div class="col-md-6">
                                <input id="last-name" type="text" class="form-control" name="last_name" value="" required v-model="lastName">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="" required v-model="email">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required v-model="password">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required v-model="passwordConfirmation">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return {
                firstName: null,
                lastName: null,
                email: null,
                password: null,
                passwordConfirmation: null,
                errors: null
            }
        },
        methods:{
            onSubmit(event){
                axios.post('/api/v1/register', {
                    email: this.email,
                    password: this.password,
                    first_name: this.firstName,
                    last_name: this.lastName,
                    password_confirmation: this.passwordConfirmation
                })
                .then((response) => {
                    console.log(response);
                    this.$store.commit('setUser', response.data);
                    this.$cookie.set('authorization', JSON.stringify({token: response.data.token, url: response.data.href}) , { expires: '1M' });
                    this.$router.push({ path: '/' });
                })
                .catch((error) => {
                    console.log(error.response.data);
                    this.errors = error.response.data;
                    setTimeout(() => {
                      this.errors = null;
                    }, 2000)
                });
            }
        }
    }
</script>
